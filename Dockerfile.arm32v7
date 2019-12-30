# get x86 arm-qemu-binary to be able to compile on hub.docker.com
FROM alpine AS qemu_arm32
#QEMU Download
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v7/node:lts-alpine
# Add QEMU
COPY --from=qemu_arm32 qemu-arm-static /usr/bin

ARG MQTT_HOST=127.0.0.1
ARG MQTT_PORT=1833

ENV MQTT_HOST=$MQTT_HOST
ENV MQTT_PORT=$MQTT_PORT

WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN apk --update add git less openssh gettext && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN npm install

VOLUME [ "/broadlink-mqtt-bridge/config", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000 3001

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["npm", "start"]
