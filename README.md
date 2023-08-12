# ehfordwarderbot docker

A unofficial docker image for https://github.com/blueset/ehForwarderBot

this image only support wechat\<-\>telegram.

## build image

clone this repository

```shell
git clone https://github.com/asiocity/efb-docker.git && cd efb-docker
```

build efb image

```shell
docker build -t efb:latest .
```

## usage

### 1. create efb configure folders and files

```
/path/to/efb/config/
    ├── blueset.telegram
    │   └── config.yaml
    ├── config.yaml
    └── docker-compose.yml
```

/path/to/efb/config/config.yaml

[reference](https://ehforwarderbot.readthedocs.io/en/latest/config.html)

```yaml
master_channel: blueset.telegram                                                      
slave_channels:
- blueset.wechat
```

/path/to/efb/config/config.yaml

[reference](https://github.com/blueset/efb-telegram-master/)

get your token from @botfather

get your id from @userinfobot

```yaml
##################
# Required items #
##################

# [Bot Token]
# This is the token you obtained from @BotFather
token: "012345678:1Aa2Bb3Vc4Dd5Ee6Gg7Hh8Ii9Jj0Kk1Ll2M"

# [List of Admin User IDs]
# ETM will only process messages and commands from users
# listed below. This ID can be obtained from various ways
# on Telegram.
admins:
- 012345

##################
# Optional items #
##################
# [Experimental Flags]
# This section can be used to toggle experimental functionality.
# These features may be changed or removed at any time.
# Options in this section is explained afterward.
flags:
  message_muted_on_slave: mute

# [Network Configurations]
# [RPC Interface]
# Refer to relevant sections afterwards for details.
# [Proxy]
request_kwargs:
  # HTTP proxy
  #proxy_url: http://172.18.0.1:8118
  # Optional, if you need authentication:
  #username: PROXY_USER
  #password: PROXY_PASS
  # SOCKS5 proxy
  #proxy_url: socks5://172.18.0.1:1080
  # Optional, if you need authentication:
  #urllib3_proxy_kwargs:
  #  username: PROXY_USER
  #  password: PROXY_PASS

```

/path/to/efb/config/docker-compose.yml

```yaml
version: '3' 
services:
  efb:
    image: efb 
    container_name: efb 
    volumes:
    - /path/to/efb/config/:/root/.ehforwarderbot/profiles/default/ 
    restart: unless-stopped
```

### 2. start a efb docker container

#### 2.1 use docker-compose

```shell
cd /path/to/efb/config/
docker-compose up -d
```

#### 2.2 manual

```shell
docker run -d --restart=unless-stopped \
    --name efb \
    -v /path/to/efb/config:/root/.ehforwarderbot/profiles/default/ \
    efb:latest
```

### 3. login wechat

```shell
docker logs efb
```

