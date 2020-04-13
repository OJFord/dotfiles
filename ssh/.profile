if [ -d "$HOME/.ssh" ]; then
    rm -r "$HOME/.ssh"
    ln -sT "$XDG_CONFIG_HOME/ssh/" "$HOME/.ssh"
fi
