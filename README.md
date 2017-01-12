# myrc
=====
use these config files to improve your linux workflow.

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
