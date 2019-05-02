export LANG="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

if [ "$(uname -s)" = Darwin ]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export PATH="/usr/local/opt/findutils/libexec/bin:$PATH"
    export MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"

    export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"
else
    export PATH="/usr/share/git/diff-highlight:$PATH"
fi


# Homes
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$XDG_CONFIG_HOME/bin:$PATH"

export XINITRC="$XDG_CONFIG_HOME/X/.xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X/.xserverrc"

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

export VIMDIR="$XDG_CONFIG_HOME/vim"
export VIMRC="$VIMDIR/.vimrc"
export EDITOR="vim -u $VIMRC"

export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"


# Startup
if [ "$(uname -s)" != Darwin ]; then
    exec startx "$XINITRC"
fi
