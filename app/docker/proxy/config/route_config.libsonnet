{
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
}