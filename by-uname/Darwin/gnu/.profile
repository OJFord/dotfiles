PATH="$(fd --print0 --follow gnubin /opt/homebrew/Cellar/ | xargs -0 -I@ printf '@:')$PATH"
export PATH
MANPATH="$(fd --print0 --follow gnuman /opt/homebrew/Cellar/ | xargs -0 -I@ printf '@:')$MANPATH"
export MANPATH
