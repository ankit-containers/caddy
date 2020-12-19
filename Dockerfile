FROM alpine:latest AS puller

ENV CADDY_VERSION=2.2.1

RUN wget "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz" \
    && tar -xvf caddy_${CADDY_VERSION}_linux_amd64.tar.gz

FROM gcr.io/distroless/static
LABEL maintainer="Ankit R Gadiya ankit@argp.in"

COPY --from=puller /caddy /caddy
ENTRYPOINT ["/caddy"]
