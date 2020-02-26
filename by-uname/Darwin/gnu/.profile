PATH="$(fd --print0 --follow gnubin /usr/local/opt/*/libexec | xargs -0 -I@ printf '@:')$PATH"
export PATH
MANPATH="$(fd --print0 --follow gnuman /usr/local/opt/*/libexec | xargs -0 -I@ printf '@:')$MANPATH"
export MANPATH

export PATH="/usr/local/opt/diffutils/bin:$PATH"
export MANPATH="/usr/local/opt/diffutils/share/man:$MANPATH"

export PATH="/usr/local/opt/findutils/libexec/bin:$PATH"
export MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"
