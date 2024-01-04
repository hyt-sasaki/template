FROM amazon/aws-for-fluent-bit:2.32.0.20231205

COPY ./docker/log_router/conf/common.conf /fluent-bit/etc/common.conf
COPY ./docker/log_router/conf/extra.conf /fluent-bit/etc/extra.conf
COPY ./docker/log_router/conf/proxy_parser.conf /fluent-bit/parsers/proxy_parser.conf
COPY ./docker/log_router/conf/authorizer_parser.conf /fluent-bit/parsers/authorizer_parser.conf
COPY ./docker/log_router/healthcheck.sh /root/healthcheck.sh
