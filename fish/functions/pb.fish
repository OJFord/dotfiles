function pb
    begin
        set --local IFS
        set list (passbase ls)
    end
    if test "$argv"; and test (echo "$list" | rg --count "^$argv\$") -eq 1
        set read "$argv"
    else
        set read (echo "$list" | fzf --no-preview --no-multi --query="$argv")
    end

    passbase read "$read" | pbcopy
end
