#!/bin/bash

set -e

MIX_ENV=${mix_env:-dev}
export MIX_ENV="$MIX_ENV"

echo "==> Setting up for MIX_ENV=$MIX_ENV " 

if [[ "$MIX_ENV" = "test" ]]
 then
    echo "==> Setting up tests envs"
    source sh/env.test.sh
else
  echo "==> Skipping source test env"
fi

if [[ $MIX_ENV -eq "test" ]]
 then
    echo "==> Skipping services"
else
  docker-compose -f docker-compose.dev.yml up -d
fi

echo "==> Setting up dependancies"
mix deps.get
mix compile --warnings-as-errors

echo "==> Setting up assets"
cd assets/
yarn install
cd ../

if [[ "$MIX_ENV" = "prod" ]]
 then
    echo "==> Skipping database setup in $MIX_ENV"
else
  echo "==> Setting up databases"
  mix do ecto.create, ecto.load --skip-if-loaded, ecto.migrate, run priv/repo/seeds.exs
fi
