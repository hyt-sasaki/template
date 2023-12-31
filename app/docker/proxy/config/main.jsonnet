local admin = import 'admin.libsonnet';
local listener = import 'listeners/listener.libsonnet';
local clusters = import 'clusters/clusters.libsonnet';

{
    admin: admin,
    static_resources: {
        listeners: [listener],
        clusters: clusters,
    },
}