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

# Use vi bindings
fish_vi_mode

# Repeat last command as root with `sudo !!`
function sudo
    if test $argv[1] = '!!'
        eval /usr/bin/sudo $history[1]
    else
        eval /usr/bin/sudo $argv
    end
end function

alias ls            "ls -FG"    # colourise and display dir,exec,etc. icons
alias ll            "ls -FGhlo" # long-list, use KB,MB,etc. sizes, no group id
alias lla           "ls -AFGhl" # include dotfiles, except ./ and ../
alias gz            "tar -zcvf" # zip tar.gz
alias ping          prettyping  # use prettyping over ping
alias gitl          "git lola"  # lola (pretty log) alias defined in gitconfig
alias gits          "git status"
alias youtube-dl    "youtube-dl --external-downloader=aria2c"

# GPG
pgrep -x -u "$USER" gpg-agent >/dev/null ^/dev/null; \
    or gpg-connect-agent /bye >/dev/null ^/dev/null
## set SSH to use gpg-agent
set -e SSH_AGENT_PID
if test "$gnupg_SSH_AUTH_SOCK_by" = %self
    set SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
end
## set GPG TTY
set -g GPG_TTY (tty)
