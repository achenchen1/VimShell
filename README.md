Goals:
This plugin will hopefully accomplish the following:
* Using ```:vimshell```, it will open another completely separate shell/terminal in the working directory that Vim is currently running from
* Will accept arguments including:
	* Some command, e.g. ```:vimshell ipconfig``` should open another terminal and show the results of ipconfig, and be able to take another input
	* Some location, e.g. ```:vimshell ls /Users/AliceAndBob``` should open another terminal in /Users/AliceAndBob and list the files and directories
	* Be able to, if the right credentials are available/used, use ```sudo``` or ```as Administrator```
* Be compatible with Windows and Mac
