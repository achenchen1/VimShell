" Figure out how to get OS

func! commands#openTerminal(...)
    let g:os = commands#getOSInfo()
    if g:os == "Linux"
        execute "! open -a terminal" 
        " need to investigate if this is actually right
    elseif g:os == "Darwin"
        execute "! open -a terminal"
    elseif g:os == "Windows"
        execute "! start cmd"  
    else
        echo g:os
    endif
endf

func! commands#openMacTerminal(...)
    execute "!open -a terminal ~"
    for x in a:000
	    echo x
    endfor
    echo a:0
endf

func! commands#getOSInfo()
    let l:output = system("uname")
    if l:output =~ "Linux"
	    return "Linux"
    elseif output =~ "Darwin"
        return "macOS"
    else
        let l:output = system("ver")
        if l:output =~ "Windows"
            return "Windows"
        else
            return "OS not recognized"
        endif
    endif
endf
