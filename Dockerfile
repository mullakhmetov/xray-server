ARG XRAY_RELEASE=latest
FROM ghcr.io/xtls/xray-core:${XRAY_RELEASE} as xray

FROM alpine:3.21

RUN apk add --no-cache envsubst libqrencode coreutils bash && mkdir -p /etc/xray

COPY --from=xray /usr/bin/xray /bin/xray
COPY entrypoint.sh vless_template.json /opt/
COPY gen_vless_config /bin/

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["xray", "-c", "/etc/xray/config.json"]
