export FZF_DEFAULT_COMMAND='fd --type=file --type=symlink --hidden --follow --exclude=.git'
cat > "$XDG_CONFIG_HOME/fzf/env.conf" <<-EOF
	FZF_DEFAULT_OPTS='--preview="bat {}" --bind="ctrl-b:execute(bat {})" --reverse --multi --height=100%'
EOF

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
