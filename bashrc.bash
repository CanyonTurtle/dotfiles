




# ---------- GENERAL ----------




# my aliases
alias l="ls -la"
alias v="nvim"
alias r=ranger
alias rosm="source /opt/ros/melodic/setup.bash"
alias ross="source /home/cannontuttle/Documents/rosserial-roslib/devel/setup.bash"
alias rosc="source /home/cannontuttle/Documents/cortex-rosserial-copy/rosland/install/setup.bash"
alias pmut="pros make clean; pros mut"
alias pmu="pros make clean; pros mu"
alias p="cd ~/Documents/rosserial-roslib/proslandia"
alias sernode="rosrun rosserial_arduino serial_node.py"
alias sernode1="rosrun rosserial_arduino serial_node.py _port:=/dev/ttyACM1 _baud:=115200"
alias sernode0="rosrun rosserial_arduino serial_node.py _port:=/dev/ttyACM0 _baud:=115200"
alias sernodeu="rosrun rosserial_arduino serial_node.py _port:=/dev/ttyUSB0"
alias a="fc -s"
alias pmus="pmu; sernode"
alias si="source install/setup.bash"
alias sib="source ~/Documents/betterpr/devel/setup.bash"

alias ccc="catkin_make clean; catkin_make install"
alias pm="pros make clean; pros make"
alias roslibregen="rm -rf ../include/ros_lib; rosrun rosserial_vex_cortex make_libraries.py ."

# git
alias ga="git add"
alias gc="git commit"

# fixing color on windows
alias tmux="env TERM=xterm-256color tmux"

# set up color when listing directories
LS_COLORS='ow=01;36;40'
export LS_COLORS

# use vim as editor
export EDITOR=nvim

# uncomment for use of node
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vr="v -c Ranger"
# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
# 
# On OS X 10 or later, replace `usr/bin/ranger` with `/usr/local/bin/ranger`.

function ranger-cd {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
  }

# This binds Ctrl-O to ranger-cd:
# bind '"\C-o":"ranger-cd\C-m"'
# bind '"\C-p":"nvim -c CtrlP\C-m"'

# use vim because why not
bind '";q\C-m":"exit\C-m"'
bind '";e.\C-m":"nvim .\C-m"'
bind '";e\C-m":"nvim\C-m"'
bind '"\C-o":"nvim -c Ctrlo\C-m"'

PS1='(⌐■_■) \w$ '

unset color_prompt force_color_prompt
