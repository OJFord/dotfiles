for f in "$XDG_CONFIG_HOME"/**/Vagrantfile; do
    dir="$(dirname "$f")"
    name="$(basename "$dir")"
    cat > "$XDG_DATA_HOME/applications/$name.desktop" <<-EOF
	[Desktop Entry]
	Name=$name
	Type=Application
	Path=$dir
	Exec=vagrant up
EOF
done
