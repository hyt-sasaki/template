local cluster(name, address, port) = {
    name: name,
    type: "STRICT_DNS",
    lb_policy: "ROUND_ROBIN",
    load_assignment: {
        cluster_name: name,
        endpoints: [{
            lb_endpoints: {
                endpoint: {
                    address: {
                        socket_address: {
                            address: address,
                            port_value: port,
                        }
                    }
                }
            }
        }],
    },
    typed_extension_protocol_options: {
        "envoy.extensions.upstreams.http.v3.HttpProtocolOptions": {
            "@type": "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions",
            explicit_http_config: {
                http2_protocol_options: { }
            }
        }
    }
};

[
    cluster("api_cluster", "host.docker.internal", 8080),
    cluster("authorizer_cluster", "authorizer", 4000),
]
