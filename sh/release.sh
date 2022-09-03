#!/bin/bash

set -e

MIX_ENV=${mix_env:-prod}
export MIX_ENV="$MIX_ENV"
echo "==> Running release fopr ENV: MIX_ENV=$MIX_ENV " 
echo "==> Running pre-relesase tasks"
echo "==> Setting up dependancies"
mix deps.get
mix compile

echo "==> Setting up assets"
cd assets/
yarn install
cd ../

mix assets.deploy
mix phx.digest

echo "==> Starting release"
mix distillery.release --env=prod
echo "==> Release success"

version="$(cat mix.exs | grep version | sed -e 's/.*version: "\(.*\)",/\1/')"
version_name="$(echo "$version" | tr . -)"

cp _build/$MIX_ENV/rel/tool_box/releases/$version/tool_box.tar.gz tool_box.tar.gz