set -e

MIX_ENV=${mix_env:-dev}
export MIX_ENV="$MIX_ENV"

echo "==> Reseting ecto repos for MIX_ENV=$MIX_ENV"
mix do ecto.reset
