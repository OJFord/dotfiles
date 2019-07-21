function _aws_profiles
    sed -En 's/\[ *profile +([^ ]*) *\]/\1/p' "$AWS_CONFIG_FILE"
end

function awsctx
    # list profiles
    if test -z "$argv"
        set active (aws configure list | rg ' *profile' | sed -En 's/ *profile *([^ ]+) .*/\1/p')
        for profile in (_aws_profiles)
            if test "$profile" = "$active"
                echo " * $active"
            else
                echo "   $profile"
            end
        end
        return 0
    end

    # set profile
    if _aws_profiles | rg "$argv" >/dev/null
        set --universal --export AWS_DEFAULT_PROFILE "$argv"
        return 0
    else
        echo "Unrecognised profile: $argv" >&2
        echo 'Options are: ' >&2
        _aws_profiles | xargs -I@ echo ' - @' >&2
        return 1
    end
end
