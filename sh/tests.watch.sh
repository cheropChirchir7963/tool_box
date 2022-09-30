#!/bin/bash

set -e

MIX_ENV=${mix_env:-test}
export MIX_ENV="$MIX_ENV"

source sh/env.test.sh


make db.reset.ecto mix_env=$MIX_ENV


mix ecto.drop
mix do ecto.create, ecto.load --skip-if-loaded, ecto.migrate

mix test.watch

echo jobs

trap "killall background" EXIT