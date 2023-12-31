FROM alpine:latest AS builder

COPY ./docker/proxy/config /config
RUN apk --no-cache add jsonnet

RUN jsonnet /config/main.jsonnet > /envoy.json

FROM envoyproxy/envoy:tools-v1.28-latest
COPY --from=builder /envoy.json /config/envoy.json
ENTRYPOINT ["/usr/local/bin/envoy", "-c", "/config/envoy.json"]
