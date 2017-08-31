fish_vi_key_bindings

set -x LANG en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8

set -x XDG_CONFIG_HOME $HOME/.config
set -x PATH $XDG_CONFIG_HOME/bin $PATH

set -x XDG_RUNTIME_DIR /var/run

# Set SSH to use gpg-agent
set -x GNUPGHOME $XDG_CONFIG_HOME/gnupg
if set --query SSH_AGENT_PID
    set --erase SSH_AGENT_PID
end
if not gpg-agent >/dev/null ^&1; or not set --query SSH_AUTH_SOCK
    killall gpg-agent >/dev/null ^&1
    set --universal SSH_AUTH_SOCK (gpg-agent --daemon | cut -d'=' -f2 | cut -d';' -f1) ^/dev/null
    set --erase GPG_TTY
    set --universal GPG_TTY (tty)
end

set -x VIMDIR $XDG_CONFIG_HOME/vim
set -x VIMRC $VIMDIR/.vimrc

set -x EDITOR "vim -u $VIMRC"
set -x VISUAL "vim -u $VIMRC"

alias dc docker-compose
alias gitl "git lol"
alias gits "git status"
alias gz "tar -zcvf"
alias ll "ls -l"
alias lla "ll -A"
alias ping prettyping
alias vim "vim -u $VIMRC"

set -x PATH $HOME/go/bin $PATH
set -x CARGO_HOME = $XDG_CONFIG_HOME/cargo
set -x PATH $CARGO_HOME/bin $PATH

set -x PATH /usr/share/git/diff-highlight $PATH
