AWS_CONFIG_FILE="$XDG_CACHE_HOME/aws/config"
mkdir -p "$(dirname "$AWS_CONFIG_FILE")"
export AWS_CONFIG_FILE
find "$XDG_CONFIG_HOME"/*.dotfiles/aws/ -name config -exec cat "$XDG_CONFIG_HOME/aws/config" {} + > "$AWS_CONFIG_FILE"
export AWS_SDK_LOAD_CONFIG=1
