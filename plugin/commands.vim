" Figure out how to get OS
func! commands#openTerminal(...)
    let g:dir_specified = 0
    let g:admin = 0 
    let g:exit = 0

    let g:os = commands#getOSInfo()

    let l:command_string = commands#parseArgString(...)

    if g:os == "Linux"
        echo "Need to investigate"
	" need to investigate if this is actually right
    elseif g:os == "Darwin"
        call commands#openMacTerminal(l:command_string)
    elseif g:os == "Windows"
        call commands#openWindowsTerminal(l:command_string) 
    else
        echo g:os
    endif
endf

func! commands#parseArgString(...)
    for arg in a:000
	if arg == "--dir" || x == "-d"
	    if g:dir_specified
		" Should navigate to directory
		let l:dir = commands#findDirectory(arg+1)
		" Figure out how to access 'next' argument	
	    else
		echo "Directory already specified to"
		" Find out if this will auto-insert a new line, and if so,
		" string replacement.
	    endif
	elseif 
	    arg == "--admin" || arg == "-a"
	    let g:admin = 1
	elseif
	    arg == "--exit" || arg == "-x"
	else
	    " pass?
	endif
    endfor
endf

func! commands#openMacTerminal(...)
    l:command = "!open -a terminal ~"
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
