#!/bin/bash

set -e

MIX_ENV=${mix_env:-dev}
export MIX_ENV="$MIX_ENV"

echo "==> Resetting application for MIX_ENV=$MIX_ENV"

mix do ecto.drop ecto.create, ecto.load, ecto.migrate, run priv/repo/seeds.exs

