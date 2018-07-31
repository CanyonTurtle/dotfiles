
### vim

# first, [install Vim Plug](https://github.com/junegunn/vim-plug).
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# source vimrc
touch ~/.vimrc
echo "so ~/.dotfiles/vimrc.vim" >> ~/.vimrc

### neovim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
echo "so ~/.dotfiles/nvimrc.vim" >> ~/.config/nvim/init.vim

# follow additional configuration steps on neovim.com to set the default editor to nvim.

### tmux
touch ~/.tmux.conf; echo "source-file ~/.dotfiles/tmux.conf" >> ~/.tmux.conf

### bash
touch ~/.bashrc; echo "source ~/.dotfiles/bashrc.bash" >> ~/.bashrc

