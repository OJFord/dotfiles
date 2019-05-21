function ls
    if not type lsd 2>/dev/null
        echo 'ls deluxe seems not to be installed' >&2
        echo '=> https://github.com/Peltoche/lsd' >&2
        return 1
    end

    lsd $argv
end
