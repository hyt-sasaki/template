[
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
]