bass source .profile
fish_vi_key_bindings

status --is-interactive; and source (pyenv init - | psub)
pyenv global 3.7.3

gpg-connect-agent reloadagent updatestartuptty /bye >/dev/null
set -e GPG_TTY; set -x --universal GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

for config in (find $XDG_CONFIG_HOME -wholename '*.dotfiles/fish/config.fish')
    source $config
end

for autoload_fn in (find $XDG_CONFIG_HOME -wholename '*.dotfiles/fish/functions/*.fish')
    if not test -L (echo "$autoload_fn" | sed -r 's|.*\.dotfiles/fish|'"$XDG_CONFIG_HOME"'/fish|')
        ln -s $autoload_fn $XDG_CONFIG_HOME/fish/functions
    end
end

for completion in (find $XDG_CONFIG_HOME -wholename '*.dotfiles/fish/completions/*.fish')
    if not test -L (echo "$completion" | sed -r 's|.*\.dotfiles/fish|'"$XDG_CONFIG_HOME"'/fish|')
        ln -s $completion $XDG_CONFIG_HOME/fish/completions
    end
end
