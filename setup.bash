
echo "Performing environment setup for  Vim,  Bash,  Neovim, and Tmux..."

### vim

# first, [install Vim Plug](https://github.com/junegunn/vim-plug).
if [ ! -f ~/.vim/autoload/plug.vim ]
then
    echo "	Installing Vim plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "	Vim plug already installed."
fi

# source vimrc
touch ~/.vimrc
if ! grep -q "so ~/.dotfiles/vimrc.vim" ~/.vimrc
then
    echo "	sourcing vim configurations in vimrc..."
    echo "so ~/.dotfiles/vimrc.vim" >> ~/.vimrc
else
    echo "	Vimrc already sourced."
fi

### neovim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
if ! grep -q "so ~/.dotfiles/nvimrc.vim" ~/.config/nvim/init.vim
then
    echo "	sourcing neovim configurations in init.vim..."
    echo "so ~/.dotfiles/nvimrc.vim" >> ~/.config/nvim/init.vim
else
    echo "	neovim config already sourced."
fi

# follow additional configuration steps on neovim.com to set the default editor to nvim.

### tmux
touch ~/.tmux.conf;
if ! grep -q "source-file ~/.dotfiles/tmux.conf" ~/.tmux.conf
then
    echo "	Sourcing tmux configurations in tmux.conf..."
    echo "source-file ~/.dotfiles/tmux.conf" >> ~/.tmux.conf
else
    echo "	Tmux configuraiton already sourced."
fi

### bash
touch ~/.bashrc;
if ! grep -q "source ~/.dotfiles/bashrc.bash" ~/.bashrc
then
    echo "	Sourcing bashrc..."
    echo "source ~/.dotfiles/bashrc.bash" >> ~/.bashrc
else
    echo "	Bashrc already sourced."
fi
### tmux resurrect stuff
if [ ! -d ~/.tmux-resurrect ]
then
    echo "	Setting up tmux resurrect..."
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux-resurrect
else
    echo "	tmux-resurrect already setup."
fi
