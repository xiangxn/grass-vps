#!/bin/bash
PORT=1087
if [ ! -n "$1" ];then
    PORT=1087
else
    PORT=$1
fi
curl -s http://myip.ipip.net
export GLOBAL_AGENT_HTTP_PROXY=http://172.17.0.1:${PORT}
/root/.nvm/versions/node/v19.9.0/bin/node -r 'global-agent/bootstrap' --max-http-header-size=1073741824 ./src/app.js