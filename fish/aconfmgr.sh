AddPackage fish
cat >> "$(GetPackageOriginalFile filesystem '/etc/shells')" <<-EOF
	/usr/bin/fish
	/bin/fish
EOF

AddPackage --foreign direnv
AddPackage fd
AddPackage fzf
AddPackage lsd
AddPackage prettyping
AddPackage psmisc
AddPackage python
AddPackage python-pip
AddPackage ripgrep
