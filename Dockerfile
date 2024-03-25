FROM alpine:latest
ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
RUN set -ex \
    && apk add --update --no-cache ca-certificates \
    && apk add --no-cache --virtual .run-deps      \
        py3-pip                                    \
        py3-wheel                                  \
        py3-ruamel.yaml                            \
        py3-pillow                                 \
        #py3-cryptography                           \
        ffmpeg                                     \
        libmagic                                   \
        libwebp
RUN set -ex \
    #&& pip3 install --upgrade pip                \
    && pip3 install --break-system-packages ehforwarderbot               \
    && pip3 install --break-system-packages efb-telegram-master          \
    && pip3 install --break-system-packages "python-telegram-bot[socks]" \
    && pip3 install --break-system-packages efb-wechat-slave
CMD ["ehforwarderbot"]

