let cmd = 'sh -c "find '.shellescape($VIMDIR).' -wholename */opt/*/ftdetect/*.vim"'
for ftdetector in split(system(cmd), "\n")
    exec 'source '.ftdetector
endfor
