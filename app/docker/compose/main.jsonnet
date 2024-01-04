local IP = "127.0.0.2";

local bind(host_port, container_port=null, ip=IP) = if container_port == null
    then "%s:%d:%d" % [IP, host_port, host_port]
    else "%s:%d:%d" % [IP, host_port, container_port];

local template(service) = {
    build: {
        context: ".",
        dockerfile: "docker/%s/Dockerfile" % service,
    }
};

local logging_config(tag) = {
    logging: {
        driver: "fluentd",
        options: {
            "fluentd-address": "%s:24224" % IP,
            tag: tag,
        }
    },
};

std.manifestYamlDoc({
    services: {
        authorizer: template("authorizer") + logging_config("authorizer-local") + {
            depends_on: ["log_router"],
        },
        proxy: template("proxy") + logging_config("proxy-local") + {
            ports: [bind(3000), bind(9901)],
            environment: [
                "AUTHORIZER_HOST=authorizer",
                "AUTHORIZER_PORT=4000",
            ],
            depends_on: ["log_router"],
        },
        log_router: template("log_router") + {
            ports: [bind(24224), bind(8877)],
            environment: [
                "PROXY_MATCH=proxy*",
                "AUTHORIZER_MATCH=authorizer*",
            ],
            volumes: [
                "./docker/log_router/conf/extra.local.conf:/fluent-bit/etc/fluent-bit.conf",
            ],
            healthcheck: {
                test: ["CMD-SHELL", "sh root/healthcheck.sh"],
                interval: "3s",
                timeout: "3s",
                retries: 3,
                start_period: "10s",
            }
        }
    },
})
