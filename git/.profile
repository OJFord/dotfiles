case "$(uname -s)" in
    Darwin)
        export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"
        ;;
    Linux)
        export PATH="/usr/share/git/diff-highlight:$PATH"
        ;;
esac
