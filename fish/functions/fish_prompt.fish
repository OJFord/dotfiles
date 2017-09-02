function fish_prompt
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1
    set -g __fish_git_prompt_color_branch green --bold
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""
    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"
    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold
    set -g __fish_prompt_normal (set_color normal)

    if git rev-parse >/dev/null ^&1
        set path (git rev-parse --show-toplevel)
        if [ (git rev-parse --is-inside-git-dir) = 'true' ]
            set git_path .git
        else
            set git_path (git rev-parse --show-prefix)
        end
	set git (__fish_vcs_prompt | tr -d ' ')
    else
        set path (pwd)
    end

    echo -n (echo $path | string replace $HOME '~')
    echo -n $git
    echo -n $gitpath

    set_color --bold brwhite
    echo -n '>'
    set_color normal
end
