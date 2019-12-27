ARG MQTT_HOST=127.0.0.1
ARG MQTT_PORT=1833

ENV $MQTT-HOST
ENV $MQTT-PORT

FROM node:lts-alpine

WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN npm install

ENTRYPOINT ["npm", "start"]

VOLUME [ "/broadlink-mqtt-bridge/config", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000 3001