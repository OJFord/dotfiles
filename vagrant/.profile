for f in "$XDG_CONFIG_HOME"/**/Vagrantfile; do
    dir="$(dirname "$f")"
    name="$(basename "$dir")"

    desktopf="$XDG_DATA_HOME/applications/$name.desktop"
    mkdir -p "$(dirname "$desktopf")"
    test -f "$desktopf" || cat > "$desktopf" <<-EOF
		[Desktop Entry]
		Name=$name
		Type=Application
		Path=$dir
		Exec=vagrant up
EOF
done
