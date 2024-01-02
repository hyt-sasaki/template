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

std.manifestYamlDoc({
    services: {
        proxy: template("proxy") + {
            ports: [bind(3000), bind(9901)]
        },
    },
})
