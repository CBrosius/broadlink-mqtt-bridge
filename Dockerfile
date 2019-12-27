ARG MQTT-HOST="127.0.0.1"
ARG MQTT-PORT="1833"

ENV MQTT_HOST=$MQTT-HOST
ENV MQTT_PORT=$MQTT-PORT

FROM node:lts-alpine

ENV NODE_ENV production

WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN npm install

ENTRYPOINT ["npm", "start"]

VOLUME [ "/broadlink-mqtt-bridge/config", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000 3001