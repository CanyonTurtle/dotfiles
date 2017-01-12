# myrc
Use these config files to improve shell-based linux editing workflow.

##Features
1. Vim
  * ease-of-use remap of escape to jk
  * remap of ; to : for easy commands
  * see command bar, wildmenu, ect.
  * change spacing-related settings: ':call Tabz(4)' will set document up for 4-space tabs. 
2. Shell
  * aliases for git, vim
3. Tmux
  * map prefixer to ctrl-a
4. Git
  * many aliases, on shell and git level
  * gitignore included

##Setup
Clone this repository into your home directory:

`git clone https://github.com/CanyonTurtle/myrc`

Create links to these config files your already-existing ones:
```

for vim, example vimrc include in /etc/vim/vimrc :

...

if filereadable(/"home/YourUserName/myrc/vimrc.vim")
  source /home/YourUserName/myrc/vimrc.vim
endif

...

for bash, example bashrc include in ~/.bashrc :

...

. ~/myrc/bashrc

...
```

for tmux, simply rename `tmux.conf` to `.tmux.conf` and place in home directory:
`mv tmux.conf ~/.tmux.conf`
for git, similarly: `mv gitignore ~/.gitignore` and `mv gitconfig ~/.gitconfig`
###Credit
Git config source [https://gist.github.com/pksunkara/988716#file-gitconfig]
