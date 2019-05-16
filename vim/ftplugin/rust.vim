if empty(glob($HOME.'/rust'))
    silent !git clone "https://github.com/rust-lang/rust" --depth=1 "$HOME/rust"
endif

let g:ycm_rust_src_path = $HOME.'/rust/src'
