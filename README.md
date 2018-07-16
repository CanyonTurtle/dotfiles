# Dotfiles

Configuration for vim neovim, and tmux.
To see what configuration is provided, read the configuration files and their inline documetation.

Most of the content of the configuration is not my own; it comes from a mix of boilerplate and configuration setups listed here:
- [oh my tmux](https://github.com/gpakosz/.tmux)
- [the best and greatest tmux conf ever](https://gist.github.com/spicycode/1229612)

Note: for tmux and vim to look nice, there needs to be unicode font and 256 color support in the terminal.

## Features
- Vim:
  - plugin manager
  - syntax
  - visual / color scheme
  - custom mappings
- tmux
  - custom look
  - custom mappings
- bash
  - custom aliases
  - color configuration

## Configuration 

This guides through setting up a new BASH environment with these configuration files

```bash
cd ~
git clone https://github.com/CanyonTurtle/dotfiles.git
```

### vim

first, [install Vim Plug](https://github.com/junegunn/vim-plug). Then:

```bash
touch ~/.vimrc
echo "so ~/dotfiles/vimrc.vim" >> ~/.vimrc
```
### neovim

do the vim instruction as above, and then: 

```bash
touch ~/.config/nvim/init.vim
echo "so ~/dotfiles/nvimrc.vim" >> ~/.config/nvim/init.vim

```

follow additional configuration steps on neovim.com to set the default editor to nvim.

### tmux

```bash
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
touch .tmux.conf.local
echo "source-file ~/dotfiles/tmux.conf" >> ~/.tmux.conf.local
```

### bash
```bash
touch ~/.bashrc
echo "source ~/dotfiles/bashrc.bash" >> ~/.bashrc
```

