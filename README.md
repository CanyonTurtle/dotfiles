# Dotfiles

Configuration for vim neovim, and tmux.

To see what configuration is provided, read the configuration files and their inline documetation.

## Configuration a new BASH environment with these configuration files

```bash
cd ~
git clone https://github.com/CanyonTurtle/dotfiles.git
```

### vim

```bash
touch ~/.vimrc
echo "so ~/dotfiles/vimrc.vim" >> ~/.vimrc
```
### neovim
do the vim instruction as above, and then add the following to `~/.config/nvim/init.vim`:

```vimscript
set runtimepath^=~/.vim runtimepatah+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

follow additional configuration steps on neovim.com to set the default editor to nvim.

### tmux
note: needs unicode font and 256 color terminal or else it doesn't look good.
``bash
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
touch .tmux.conf.local
echo "source-file ~/dotfiles/tmux.conf" >> ~/.tmux.conf.local
``

### bash
```bash
touch ~/.bashrc
echo "source ~/dotfiles/bashrc.bash" >> ~/.bashrc
```
