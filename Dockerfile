ARG MQTT-HOST="127.0.0.1"
ARG MQTT-PORT="1833"
ARG MQTT-USER=""
ARG MQTT-PASS=""

FROM node:lts-alpine

RUN apk update && apk upgrade && \
    apk add --update bash git npm

ENV NODE_ENV production

WORKDIR /broadlink-mqtt-bridge

RUN git clone --depth 1 -b master https://github.com/fbacker/broadlink-mqtt-bridge.git .
RUN npm install --unsafe-perm --silent

COPY . .

RUN npm install

ENTRYPOINT ["npm", "start"]

VOLUME [ "/broadlink-mqtt-bridge/config/local.json", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000
