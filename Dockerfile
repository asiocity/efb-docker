FROM alpine:latest

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ARG CACHEBUST=1

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --update --no-cache ca-certificates \
    && apk add --no-cache --virtual .run-deps \
        py3-pip \
        py3-wheel \
        py3-ruamel.yaml \
        py3-pillow \
        py3-urllib3 \
        #py3-cryptography \
        ffmpeg \
        libmagic \
        libwebp \
    #&& pip3 install --upgrade pip \
    && pip3 install \
        --break-system-packages \
        --root-user-action=ignore \
        -i https://pypi.tuna.tsinghua.edu.cn/simple \
        ehforwarderbot \
        efb-telegram-master \
        "python-telegram-bot[socks]" \
        efb-wechat-slave

CMD ["ehforwarderbot"]

