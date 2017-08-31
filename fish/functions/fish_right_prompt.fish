function fish_right_prompt
    set last_status $status
    if [ $last_status != 0 ]
        set_color --bold --background=yellow white
        echo -n " $last_status "
        set_color normal
    end

    set num_jobs (jobs | wc -l | tr -d ' ')
    if [ $num_jobs != 0 ]
        set_color --bold --background black white
        echo -n [unicode gear] $num_jobs
        set_color normal
    end

    switch $fish_bind_mode
    case default
        set_color --bold --background red white
        echo -n N
        set_color normal
    case visual
        set_color --bold --background magenta white
        echo -n V
        set_color normal
    case insert
        # Nothing here since INS mode is quite 'normal' for a shell
    end
end
