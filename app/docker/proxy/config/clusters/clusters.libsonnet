local api_cluster_name = "api_cluster";
[{
    name: api_cluster_name,
    connect_timeout: "0.25s",
    type: "STRICT_DNS",
    lb_policy: "ROUND_ROBIN",
    load_assignment: {
        cluster_name: api_cluster_name,
        endpoints: [{
            lb_endpoints: {
                endpoint: {
                    address: {
                        socket_address: {
                            address: "host.docker.internal",
                            port_value: 8080,
                        }
                    }
                }
            }
        }],
    }
}]