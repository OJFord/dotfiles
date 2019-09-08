for ftdetector in split(system('find '.$VIMDIR.'/pack/*/opt/*/ftdetect -name *.vim'))
    exec 'source '.ftdetector
endfor
