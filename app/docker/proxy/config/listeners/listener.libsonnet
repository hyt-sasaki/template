local listener_filter = import 'filters/listener_filter.libsonnet';
{
    name: "listener_0",
    address: {
        socket_address: {
            address: "0.0.0.0",
            port_value: 3000,
        }
    },
    filter_chains: [
        {
            filters: [listener_filter],
        }
    ],
}