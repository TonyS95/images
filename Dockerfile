# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:10-alpine

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN       curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
            && apk add --no-cache --update libc6-compat ffmpeg git \
            && adduser -D -h /home/container container
            && npm install discord.js --force

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
