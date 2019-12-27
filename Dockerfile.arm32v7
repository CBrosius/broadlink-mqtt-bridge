# get x86 arm-qemu-binary to be able to compile on hub.docker.com
FROM alpine AS qemu_arm32
#QEMU Download
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v7/node:alpine
# Add QEMU
COPY --from=qemu_arm32 qemu-arm-static /usr/bin

WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN npm install

ENTRYPOINT ["npm", "start"]

VOLUME [ "/broadlink-mqtt-bridge/config/local.json", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000
