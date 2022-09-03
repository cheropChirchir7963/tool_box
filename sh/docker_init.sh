#!/bin/bash

export NODE_IP=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
export ERLANG_COOKIE=abc_xyz_123_efg

cat <<EOT >> _build/prod/rel/tool_box/vm.args
-name tool_box@$NODE_IP
-setcookie $ERLANG_COOKIE
-smp auto
EOT

mkdir -p - "$WEBAPP_STORAGE_HOME/phoenix_uploads"

PORT=4000 _build/prod/rel/tool_box/bin/tool_box $1