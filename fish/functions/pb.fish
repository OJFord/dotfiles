function pb
    passbase read (passbase ls | fzf --no-preview --no-multi --query="$argv") | pbcopy
end
