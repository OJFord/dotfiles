# shellcheck source=/dev/null
#!/bin/sh
set -e
this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

# Switch package manager
source "$this_dir/.bootstrap/pkg_mgr.sh"
install_pkg_mgr
install sudo

# Install window manager, omni launcher, et al.
source "$this_dir/.bootstrap/visual_env.sh"
install_wm
install_launcher
install_pdf_viewer
install_web_browser

# Install development tools
source "$this_dir/.bootstrap/dev_env.sh"
install_cli
install_dev_tools "haskell python rust shell"
install_password_mgr
install_security_key
install_svc

# Install custom fonts and patches
source "$this_dir/.bootstrap/fonts.sh"
install_fonts

# Setup VM guest tooling
source "$this_dir/.bootstrap/vm_guest.sh"
install_vm_guest
install_shared_dir "$HOME/vmshare"

# Cleanup automatic dotfiles that either won't be used, or will move to XDG dir
rubbish="$(
    find "$HOME" -maxdepth 1 -name ".*" -not -iname "$this_dir" -not -iname ".local"
)"
rm -rf "$rubbish"

# Ensure new configuration is found on next login
ln -sf "$this_dir/.profile" "$HOME/.profile"
