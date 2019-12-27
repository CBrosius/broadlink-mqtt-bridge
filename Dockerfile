ARG MQTT-HOST="127.0.0.1"
ARG MQTT-PORT="1833"
ARG MQTT-USER=""
ARG MQTT-PASS=""

FROM node:lts-alpine

ENV NODE_ENV production

WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN npm install

WORKDIR /broadlink-mqtt-bridge
COPY . .

ENTRYPOINT ["npm", "start"]

VOLUME [ "/broadlink-mqtt-bridge/config", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000 3001