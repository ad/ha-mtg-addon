#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

SECRET=$(jq -r '.secret' $CONFIG_PATH)
BIND_PORT=$(jq -r '.bind_port' $CONFIG_PATH)
DNS=$(jq -r '.dns' $CONFIG_PATH)

if [ -z "$SECRET" ] || [ "$SECRET" = "null" ] || [ "$SECRET" = "" ]; then
    echo "ERROR: secret is not set. Please configure the addon."
    exit 1
fi

echo "Starting MTG proxy on port ${BIND_PORT}..."
echo "Connect via: tg://proxy?server=YOUR_IP&port=${BIND_PORT}&secret=${SECRET}"

exec /usr/local/bin/mtg simple-run \
    "0.0.0.0:${BIND_PORT}" \
    "${SECRET}"