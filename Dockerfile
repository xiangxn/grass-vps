FROM ubuntu:20.04
ENV NVM_DIR=/root/.nvm NODE_VERSION=v19.9.0
ENV USER_IDS=2ede646a-67e7-4c51-be3c-0af4f464df78 NODE_ENV=production
ENV NODE_EXTRA_CA_CERTS=/grass-vps/src/ssl/websocket1.pem
COPY . /grass-vps
WORKDIR /grass-vps
RUN apt-get update \
    && apt-get install -y curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default \
    && rm -rf /var/lib/apt/lists/* \
    && npm install \
    && npm cache clean --force \
    && node -v \
    && curl -s http://myip.ipip.net
ENTRYPOINT ["./start.sh"]