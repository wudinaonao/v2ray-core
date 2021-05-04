FROM alpine:latest
LABEL maintainer "V2Fly Community <dev@v2fly.org>"

WORKDIR /root

COPY . /root

RUN set -ex \
    && apk add --no-cache tzdata openssl ca-certificates \
    && mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
    && mv v2ray v2ctl /usr/bin/ \
    && mv geosite.dat geoip.dat /usr/local/share/v2ray/ \
    && rm -rf ${PWD}/*

VOLUME /etc/v2ray
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.yaml" ]