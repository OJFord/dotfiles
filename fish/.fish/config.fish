# Customise prompt
function fish_prompt
    echo -n (whoami)
    set_color $fish_color_cwd
    echo -n ' '(echo $PWD | sed "s:$HOME:~:")
    if test $VIRTUAL_ENV
        echo -n '💼'
    end
    if test -d .git
        set_color -o green
        echo -n ' ('(git rev-parse --abbrev-ref HEAD)')'
    end
    set_color normal
    echo -n '> '
end function
function fish_right_prompt
    set last_status $status

    switch $fish_bind_mode
    case default
        set_color --bold --background red white
        echo -n 'NORMAL'
        set_color normal
    case visual
        set_color --bold --background magenta white
        echo -n 'VISUAL'
        set_color normal
    end

    if test $last_status != 0
        set_color --bold --background yellow white
        echo -n " $last_status "
        set_color normal
    end

    set num_jobs (jobs | wc -l | tr -d ' ')
    if test $num_jobs != 0
        set_color --bold --background black white
        echo -n "⚙ $num_jobs"
        set_color normal
    end
end function
function fish_mode_prompt
end function
