APP_VERSION="$(cat mix.exs | grep version | sed -e 's/.*version: "\(.*\)",/\1/')"

export APP_VERSION="$APP_VERSION"
export APP_VERSION_RRESOURCE_PREFIX="$(echo "$APP_VERSION" | tr . -)"