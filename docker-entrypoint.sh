#!/bin/sh

envsubst < /broadlink-mqtt-bridge/conf.template > /broadlink-mqtt-bridge/config/default.json

exec "$@"

