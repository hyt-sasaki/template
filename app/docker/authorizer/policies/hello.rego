package http.api.authz

default allow := false

allow {
    input.attributes.request.http.method == "GET"

    input.parsed_path = ["hello"]
}