#!/bin/bash
PORT=0
if [ ! -n "$1" ];then
    PORT=0
else
    PORT=$1
fi

if [ $PORT -gt 0 ]; then
    export GLOBAL_AGENT_HTTP_PROXY=http://172.17.0.1:${PORT}
    export HTTPS_PROXY=http://172.17.0.1:${PORT}
    export https_proxy=http://172.17.0.1:${PORT}
    export HTTP_PROXY=http://172.17.0.1:${PORT}
    export http_proxy=http://172.17.0.1:${PORT}
else
    export GLOBAL_AGENT_HTTP_PROXY=
    export HTTPS_PROXY=
    export https_proxy=
    export HTTP_PROXY=
    export http_proxy=
fi
echo "PORT: $PORT"
echo "GLOBAL_AGENT_HTTP_PROXY: $GLOBAL_AGENT_HTTP_PROXY"
curl -s http://myip.ipip.net
# /root/.nvm/versions/node/v19.9.0/bin/node -r 'global-agent/bootstrap' --max-http-header-size=1073741824 ./src/app.js