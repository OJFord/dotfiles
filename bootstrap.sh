#!/bin/sh
set -e
this_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

if [ "$(uname -s)" = "Darwin" ]; then
    export BOOTSTRAP_DIR="$this_dir/.bootstrap.mac"
else
    export BOOTSTRAP_DIR="$this_dir/.bootstrap.arch"
fi

# Switch package manager
# shellcheck source=/dev/null
source "$BOOTSTRAP_DIR/pkg_mgr.sh"
install_pkg_mgr

# Install rust via rustup before anything depends on it
export CARGO_HOME="$this_dir/cargo"
# shellcheck source=/dev/null
source "$BOOTSTRAP_DIR/dev_env.sh"
install_dev_tools_rust
export PATH="$CARGO_HOME/bin:$PATH"

# Install window manager, omni launcher, et al.
# shellcheck source=/dev/null
source "$BOOTSTRAP_DIR/visual_env.sh"
install_wm
install_launcher
install_pdf_viewer
install_web_browser

# Install development tools
# shellcheck source=/dev/null
source "$BOOTSTRAP_DIR/dev_env.sh"
install_cli
install_dev_tools "python shell"
install_password_mgr
install_security_key
install_svc

# Install custom fonts and patches
# shellcheck source=/dev/null
source "$BOOTSTRAP_DIR/fonts.sh"
install_fonts

if sudo dmesg | grep -i hypervisor; then
    # Setup VM guest tooling
    # shellcheck source=/dev/null
    source "$BOOTSTRAP_DIR/vm_guest.sh"
    install_vm_guest
    install_vm_shared_dir "$HOME/vmshare"
fi

# Cleanup automatic dotfiles that either won't be used, or will move to XDG dir
#!FIXME: permission denied on `vmshare`, so `find` errors
set +e
rubbish="$(
    find "$HOME" -maxdepth 1 -name ".*" -not -wholename "$this_dir" -not -iname ".local" \
        2>/dev/null
)"
set -e
rm -rf $rubbish

# Link dotfiles for XDG naysayers
ln -sf "$this_dir/atom" "$HOME/.atom"
ln -sf "$this_dir/gnupg/ssh" "$HOME/.ssh"
ln -sf "$this_dir/chunkwm/config" "$HOME/.chunkwmrc"
ln -sf "$this_dir/skhd/config" "$HOME/.skhdrc"

if (uname -s) = "Linux"
    # Ensure new configuration is found on next login
    ln -sf "$this_dir/.profile" "$HOME/.profile"
end
