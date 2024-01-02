local clusters = import 'clusters.libsonnet';
local router_config = import 'route_config.libsonnet';
local http_filters = import 'http_filters.libsonnet';

local listener_filter = {
    name: "envoy.filters.network.http_connection_manaager",
    typed_config: {
        "@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager",
        stat_prefix: "ingress_http",
        codec_type: "AUTO",
        generate_request_id: true,
        route_config: router_config,
        http_filters: http_filters,
    }
};

local INGRESS_PORT = 3000;
local ADMIN_PORT = 9901;

{
    admin: {
        address: {
            socket_address: {
                address: "0.0.0.0",
                port_value: ADMIN_PORT,
            }
        }
    },
    static_resources: {
        listeners: [{
            name: "listener_0",
            address: {
                socket_address: {
                    address: "0.0.0.0",
                    port_value: INGRESS_PORT,
                }
            },
            filter_chains: [
                {
                    filters: [listener_filter],
                }
            ],
        }],
        clusters: clusters,
    },
}