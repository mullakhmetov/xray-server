#!/bin/sh

/bin/gen_vless_config /opt/vless_template.json /opt/vless_config.json
cp /opt/vless_config.json /etc/xray/config.json

exec "$@"
