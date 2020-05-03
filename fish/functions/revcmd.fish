function revcmd
    set cmd "$argv[1]"
    set rev_params "$argv[-1..2]"

    eval "$cmd $rev_params"
end
