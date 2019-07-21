PATH="$(find -L /usr/local/opt -name gnubin -print0 | xargs -0 -I@ printf '@:')$PATH"
export PATH
MANPATH="$(find -L /usr/local/opt -name gnuman -print0 | xargs -0 -I@ printf '@:')$MANPATH"
export MANPATH

export PATH="/usr/local/opt/diffutils/bin:$PATH"
export MANPATH="/usr/local/opt/diffutils/share/man:$MANPATH"

export PATH="/usr/local/opt/findutils/libexec/bin:$PATH"
export MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"
