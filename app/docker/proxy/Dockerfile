FROM alpine:latest AS builder
RUN apk --no-cache add jsonnet

COPY ./docker/proxy/config /config
RUN jsonnet /config/main.jsonnet > /envoy.json

FROM envoyproxy/envoy:tools-v1.28-latest
COPY --from=builder /envoy.json /config/envoy.json
ENTRYPOINT ["/usr/local/bin/envoy", "-c", "/config/envoy.json"]
