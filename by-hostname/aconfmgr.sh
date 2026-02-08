# shellcheck shell=bash
cat > "$(CreateFile /etc/cmdline.d/hostname.conf 755)" <<-EOF
	systemd.hostname=$(uname --nodename)
EOF
