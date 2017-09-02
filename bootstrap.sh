# shellcheck source=/dev/null
#!/bin/sh
set -e
this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
export BOOTSTRAP_DIR="$this_dir/.bootstrap"

# Switch package manager
source "$BOOTSTRAP_DIR/pkg_mgr.sh"
install_pkg_mgr
require sudo

# Install rust via rustup before anything depends on it
require rustup
rustup default stable

# Install window manager, omni launcher, et al.
source "$BOOTSTRAP_DIR/visual_env.sh"
install_wm
install_launcher
install_pdf_viewer
install_web_browser

# Install development tools
source "$BOOTSTRAP_DIR/dev_env.sh"
install_cli
install_dev_tools "haskell python rust shell"
install_password_mgr
install_security_key
install_svc

# Install custom fonts and patches
source "$BOOTSTRAP_DIR/fonts.sh"
install_fonts

# Setup VM guest tooling
source "$BOOTSTRAP_DIR/vm_guest.sh"
install_vm_guest
install_shared_dir "$HOME/vmshare"

# Cleanup automatic dotfiles that either won't be used, or will move to XDG dir
rubbish="$(
    find "$HOME" -maxdepth 1 -name ".*" -not -iname "$this_dir" -not -iname ".local"
)"
rm -rf "$rubbish"

# Ensure new configuration is found on next login
ln -sf "$this_dir/.profile" "$HOME/.profile"

# Tidy up SSH + GPG agent
ln -sf "$this_dir/gnupg/ssh/" "$HOME/.ssh/"
