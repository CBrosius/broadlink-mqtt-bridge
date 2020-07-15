FROM node:lts-alpine

ARG MQTT_HOST=127.0.0.1
ARG MQTT_PORT=1833
ARG TZ=Europe/Berlin

ENV MQTT_HOST=$MQTT_HOST
ENV MQTT_PORT=$MQTT_PORT
ENV TZ=$TZ


WORKDIR /broadlink-mqtt-bridge

COPY . .

RUN apk --update add git less openssh gettext tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN npm install

VOLUME [ "/broadlink-mqtt-bridge/config", "/broadlink-mqtt-bridge/commands" ]

EXPOSE 3000 3001

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["npm", "start"]
