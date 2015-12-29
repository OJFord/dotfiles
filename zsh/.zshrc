# History
HISTFILE=~/dotfiles/zsh/.histfile
HISTSIZE=4096
SAVEHIST=4096
setopt appendhistory autocd

# Vim-mode
bindkey -v
set -o vi
export EDITOR=vim
export VISUAL=vim

# Online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Promptline
source ~/dotfiles/zsh/.promptline.sh
ZLE_RPROMPT_INDENT=0

# No bells
setopt nobeep

# GPG
## start if not running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi
## set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi
## set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

# Aliases
autoload -U compinit && compinit
alias ls="ls -FG"           # colourise and display dir,exec,etc. icons
alias ll="ls -FGhlo"        # long-list, use KB,MB,etc. sizes, no group id
alias lla="ls -AFGhl"       # include dotfiles, except ./ and ../
alias gz="tar -zcvf"        # zip tar.gz
## Git aliases
alias gitl="git lola"       # lola (pretty log) alias defined in gitconfig
alias gits="git status"
