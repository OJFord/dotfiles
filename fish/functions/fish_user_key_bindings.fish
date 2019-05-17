function fish_user_key_bindings
    set fzf_version (fzf --version | cut --delimiter=' ' --field=1)
    if not functions -q fzf_key_bindings; or test "$fzf_key_bindings_version" != "$fzf_version"
        wget \
            --quiet \
            --output-document="$XDG_CONFIG_HOME/fish/functions/fzf_key_bindings.fish" \
            "https://raw.githubusercontent.com/junegunn/fzf/$fzf_version/shell/key-bindings.fish"

        set --universal fzf_key_bindings_version "$fzf_version"
    end

    fzf_key_bindings
end
