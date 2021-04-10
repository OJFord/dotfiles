bass source .profile
set --unexport fish_greeting

for function_d in (find "$XDG_CONFIG_HOME/" -maxdepth 3 -name functions -type d)
    set fish_function_path "$function_d" $fish_function_path
end

for completion_d in (find "$XDG_CONFIG_HOME/" -maxdepth 3 -name completions -type d)
    set fish_completion_path "$completion_d" $fish_completion_path
end

direnv hook fish | source
