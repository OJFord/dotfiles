bass source "$HOME/.profile"
fish_vi_key_bindings

gpg-connect-agent reloadagent updatestartuptty /bye >/dev/null
set -e GPG_TTY; set -x --universal GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

for config in (find "$XDG_CONFIG_HOME"/*.dotfiles/fish -name 'config.fish' || true)
    source $config
end

for function_d in (find "$XDG_CONFIG_HOME"/*.dotfiles/fish -name functions -type d)
    set fish_function_path "$function_d" $fish_function_path
end

for completion_d in (find "$XDG_CONFIG_HOME"/*.dotfiles/fish -name completions -type d)
    set fish_completion_path "$completion_d" $fish_completion_path
end

direnv hook fish | source
