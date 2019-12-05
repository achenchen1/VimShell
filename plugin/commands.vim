" Figure out how to get OS

func! commands#openMacTerminal(...)
    execute "!open -a terminal ~"
    let g:os = commands#getOSInfo()
    echo g:os
    call commands#testfunc()
    for x in a:000
	    echo x
    endfor
    echo a:0
endf

func! commands#getOSInfo()
    let output = system("uname")
    if output =~ "Linux"
	    return "Linux"
    elseif output =~ "Darwin"
        return "macOS"
    else
        output = system("ver")
        if output =~ "Windows"
            return "Windows"
        else
            throw
        endif
    endif
endf

func! commands#testfunc()
    echo g:os
endf
