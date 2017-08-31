fish_vi_key_bindings

set -x LANG en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8

set -x XDG_CONFIG_HOME $HOME/.config
set -x PATH $XDG_CONFIG_HOME/bin $PATH

set -x XDG_RUNTIME_DIR /var/run


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

gpg-connect-agent updatestartuptty /bye
set -x --universal GPG_TTY (tty)
