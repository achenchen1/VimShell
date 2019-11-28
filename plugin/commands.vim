" Figure out how to get OS

func! commands#openMacTerminal(...)
    execute "!open -a terminal ~/.vim"
    echo "Testing5"
    for x in a:000
	echo x
    endfor
    echo a:0
endf
