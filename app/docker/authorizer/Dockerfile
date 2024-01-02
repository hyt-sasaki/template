FROM openpolicyagent/opa:0.60.0-envoy
COPY ./docker/authorizer/config.yaml /config/config.yaml
COPY ./docker/authorizer/policies /config/policies

CMD ["run", "--server", "-c", "/config/config.yaml", "-b", "/config/policies"]