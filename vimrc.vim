"syntax settings, use non-vi compatible features.
set nocompatible
filetype indent plugin on
syntax on

"see command suggestions whilst typing
set wildmenu
set showcmd

"highlight search results, turn off highlighing with :noh
set hlsearch

"search options
set ignorecase
set smartcase

"make vim behave intuitively
set backspace=indent,eol,start
set autoindent
set nostartofline

"displays cursor position in bottom-right
set ruler

"See rules, filename, commands all at one time
set laststatus=2
set cmdheight=2

"confirm before quitting/other hazards
set confirm

"stop the annoying bell sound when you do an illegal vim action
set visualbell
set t_vb=

"line numbers
set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"change ; to : for easier command typing in normal mode
noremap : ;
noremap ; :

"make ii and jk escape sequences, for easier exiting insert mode
:imap ii <Esc>
:imap jk <Esc>

"change the spacing with a vim command
"usage: :call Tabz(4)
fu! Tabz(num)
    let &tabstop = a:num
    let &shiftwidth = a:num
    let &softtabstop = a:num
endfunction
