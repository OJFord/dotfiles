AWS_CONFIG_FILE="$XDG_CACHE_HOME/aws/config"
mkdir -p "$(dirname "$AWS_CONFIG_FILE")"
export AWS_CONFIG_FILE
find "$XDG_CONFIG_HOME/" -mindepth 3 -wholename '*/aws/config' -exec cat "$XDG_CONFIG_HOME/aws/config" {} + > "$AWS_CONFIG_FILE"
export AWS_SDK_LOAD_CONFIG=1

cat >"$XDG_CONFIG_HOME/aws/env.conf" <<-EOC
	AWS_CONFIG_FILE="$AWS_CONFIG_FILE"
EOC
