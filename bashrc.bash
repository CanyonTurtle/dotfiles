




# ---------- GENERAL ----------




# my aliases
alias l="ls -la"
alias v="nvim"
alias r=ranger

# set up color when listing directories
LS_COLORS='ow=01;36;40'
export LS_COLORS

# use vim as editor
export EDITOR=nvim

# copy this to local .bashrc for WSL
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
  bind '"\C-o":"ranger-cd\C-m"'

  alias tmux="env TERM=xterm-256color tmux"
