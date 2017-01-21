FROM alpine:3.5
MAINTAINER Jimmy Xiao <xjm1285@gmail.com>

ENV LANG=en_US.UTF-8 \
    TZ="Asia/Shanghai" \
    S6_VERSION=v1.18.1.5

# add s6
RUN apk add --update --no-cache curl tzdata \
    && cp /usr/share/zoneinfo/"${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz \
    | tar xfz - -C / \
    && apk del --no-cache tzdata curl libcurl libssh2 ca-certificates

ENTRYPOINT ["/init"]
CMD []
