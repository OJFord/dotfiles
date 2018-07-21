fish_vi_key_bindings

alias dc "set -e DOCKER_HOST; docker-compose"
alias dkr "set -e DOCKER_HOST; docker"
alias rdkr "set -Ux DOCKER_HOST (echo \$RDKR_HOST); docker"

alias gitl "git lol"
alias gits "git status"

alias gz "tar -zcvf"

alias ll "ls -l"
alias lla "ll -A"

alias ping prettyping

alias python python3
alias pip "python -m pip"

alias vim "vim -u $VIMRC --"


set -x SHELL "fish"
set -x TERMINAL "alacritty"

set -x LANG "en_GB.UTF-8"
set -x LC_CTYPE "en_GB.UTF-8"

if not set -q XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME "$HOME/.config"
end
set -x ATOM_HOME "$XDG_CONFIG_HOME/atom"
set -x CARGO_HOME "$XDG_CONFIG_HOME/cargo"
set -x GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

set -x VIMDIR "$XDG_CONFIG_HOME/vim"
set -x VIMRC "$VIMDIR/.vimrc"
set -x EDITOR "vim -u $VIMRC"
set -x VISUAL "atom"

set -x PATH "$XDG_CONFIG_HOME/bin" \
    "$CARGO_HOME/bin" \
    "$HOME/go/bin" \
    "/usr/local/bin" \
    "/usr/local/sbin" \
    "/usr/bin" \
    "/usr/sbin" \
    "/bin" \
    "/sbin" \
    $PATH

set -x NODE_PATH "/usr/local/lib/node_modules"

if test (uname -s) = "Darwin"
    set -x PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
    set -x MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $MANPATH
    set -x PATH "/usr/local/opt/findutils/libexec/bin" $PATH
    set -x MANPATH "/usr/local/opt/findutils/share/man" $MANPATH

    set -x PATH "/usr/local/opt/git/share/git-core/contrib/diff-highlight" $PATH
else
    set -x PATH "/usr/share/git/diff-highlight" $PATH
end

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
