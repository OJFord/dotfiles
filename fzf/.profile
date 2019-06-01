export FZF_DEFAULT_COMMAND='fd --type=file --type=symlink --hidden --follow --exclude=.git'
export FZF_DEFAULT_OPTS='--preview="bat --color=always --style=plain --theme=ansi-dark {}" --bind="ctrl-b:execute(bat {})" --reverse --multi --height=100%'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
