# shellcheck shell=bash
AddPackage fish
cat >> "$(GetPackageOriginalFile filesystem '/etc/shells')" <<-EOF
	/usr/bin/fish
	/bin/fish
EOF

AddPackage direnv
AddPackage fd
AddPackage fzf
AddPackage lsd
AddPackage prettyping
AddPackage psmisc
AddPackage python
AddPackage python-pip
AddPackage ripgrep
