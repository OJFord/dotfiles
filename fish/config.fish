bass source "$HOME/.profile"
set --unexport fish_greeting
fish_vi_key_bindings

for config in (find "$XDG_CONFIG_HOME/" -name 'config.fish')
    if [ "$config" != (status -f) ]
        source $config
    end
end

for function_d in (find "$XDG_CONFIG_HOME/" -name functions -type d)
    set fish_function_path "$function_d" $fish_function_path
end

for completion_d in (find "$XDG_CONFIG_HOME/" -name completions -type d)
    set fish_completion_path "$completion_d" $fish_completion_path
end

direnv hook fish | source
