FROM alpine:latest
ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
RUN apk add --update --no-cache ca-certificates
RUN set -ex \
    && apk add --no-cache --virtual .run-deps \
        python3             \
        py3-pip             \
        ffmpeg              \
        libmagic            \
        libwebp             \
        py3-pillow          \
        py3-cryptography
RUN set -ex \
    && pip3 install --upgrade pip       \
    && pip3 install ehforwarderbot      \
    && pip3 install efb-telegram-master \
    && pip3 install efb-wechat-slave
CMD ["ehforwarderbot"]

