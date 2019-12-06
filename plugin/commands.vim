" Figure out how to get OS
func! commands#openTerminal(...)
    let g:os = commands#getOSInfo()
    if g:os == "Linux"
        echo "Need to investigate"
	" need to investigate if this is actually right
    elseif g:os == "Darwin"
        call commands#openMacTerminal(...)
    elseif g:os == "Windows"
        call commands#openWindowsTerminal(...) 
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

func! commands#openWindowsTerminal(...)
    execute "start"
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

" Just for testing and fiddling around
func! commands#openTest(...)
    " This is how I can pass optional stuff into another f unction - call.
    let g:testfunc = call(function('commands#callTest'), a:000)
    echo g:testfunc
endf

func! commands#callTest(...)
    for arg in a:000
	echo arg
    endfor
    " Hopefully I'll be able to use this to put the intended execution
    " directory at the end, and just get the last argument.
    echo get(a:, a:0)
    return "Hello world"
endf
