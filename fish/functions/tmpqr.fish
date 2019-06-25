function tmpqr
    set img_file (mktemp).png
    cat - | qrencode -o "$img_file"
    open --wait-apps "$img_file"
    rm "$img_file"
end
