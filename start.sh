#!/bin/bash
PORT=1087
if [ ! -n "$1" ];then
    PORT=1087
else
    PORT=$1
fi

export GLOBAL_AGENT_HTTP_PROXY=http://172.17.0.1:${PORT}
export HTTPS_PROXY=http://172.17.0.1:${PORT}
export https_proxy=http://172.17.0.1:${PORT}
export HTTP_PROXY=http://172.17.0.1:${PORT}
export http_proxy=http://172.17.0.1:${PORT}

curl -s http://myip.ipip.net
/root/.nvm/versions/node/v19.9.0/bin/node -r 'global-agent/bootstrap' --max-http-header-size=1073741824 ./src/app.js