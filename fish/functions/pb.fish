function pb
    passbase read (passbase ls | fzf --no-preview --no-multi) | pbcopy
end
