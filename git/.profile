case "$(uname -s)" in
    Darwin)
        export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"
        ;;
    Linux)
        export PATH="/usr/share/git/diff-highlight:$PATH"
        ;;
esac

cat \
    <(echo -en '[user]\n signingKey=') \
    <(gpg --card-status | grep 'Signature key' | tr -d ' ' | cut -d: -f2) \
    > "$XDG_CONFIG_HOME/git/active-gpg-key.config"
