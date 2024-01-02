{
    name: "envoy.filters.network.http_connection_manaager",
    typed_config: {
        "@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager",
        stat_prefix: "ingress_http",
        codec_type: "AUTO",
        generate_request_id: true,
        // ルーティング
        route_config: {
            name: "app_router",
            virtual_hosts: [
                {
                    name: "api_service",
                    domains: ["*"],
                    routes: [
                        {
                            match: { prefix: "/" }, route: { cluster: "api_cluster" },
                        }
                    ],
                }
            ]
        },
        // http filters
        http_filters: [
            {
                name: "envoy.filters.http.ext_authz",
                typed_config: {
                    "@type": "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.ExtAuthz",
                    grpc_service: {
                        envoy_grpc: {
                            cluster_name: "authorizer_cluster",
                        },
                    },
                    transport_api_version: "V3",
                }
            },
            {
                name: "envoy.filters.http.router",
                typed_config: {
                    "@type": "type.googleapis.com/envoy.extensions.filters.http.router.v3.Router",
                }
            }
        ],
    }
}