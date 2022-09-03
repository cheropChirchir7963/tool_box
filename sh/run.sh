#!/bin/bash

set -e

MIX_ENV=${mix_env:-dev}
export MIX_ENV="$MIX_ENV"

setup_for_env()
{
  echo "Running app for $1"
}

if [ $MIX_ENV == "dev" ] && [ "$2" == "debug" ]
then
   echo "Running application in debug mode"
   setup_for_env $MIX_ENV
   iex -S mix phx.server
elif [ $MIX_ENV == "dev" ]
then
   echo "Running application dev mode"
   setup_for_env $MIX_ENV
   mix phx.server
elif [ $MIX_ENV == "prod" ]
then
   echo "Prod mode"
   setup_for_env $MIX_ENV
elif [ $MIX_ENV == "prod" ]
then
    echo "Prod mode release"
   setup_for_env $MIX_ENV
else
   echo "Running default dev interactive mode"
   setup_for_env "dev"
fi
