




" ================= PLUGIN INSTALLATION ================ "




call plug#begin('~/vim/plugged')

" Standard vim defaults
Plug 'https://github.com/tpope/vim-sensible'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" the 'ranger' file browser integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


" Auto-completion (haven't figured out yet)
"Plug 'Valloric/YouCompleteMe'

" Syntax support for lots of languages
Plug 'sheerun/vim-polyglot'

" detect indents automatically
Plug 'https://github.com/tpope/vim-sleuth'

" indentation
Plug 'Yggdroot/indentLine'

" Color schemes
Plug 'neutaaaaan/iosvkem'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'

call plug#end()


" ============ PLUGIN FIXES =========== "



"----- fuzzy finder--------
"
" reveal dotfiles
let g:ctrlp_show_hidden = 1

" ignore directories where I expect lots of junk
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'




" ============== GENERAL SETTINGS ============== "




" keybinds
inoremap jk <ESC>
nmap ; :

" coloring
syntax enable
set background=dark
colorscheme hybrid_material

" Fixing indentation
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" numbering
:set number

" wildmenu options
set wildchar=<Tab> wildmenu wildmode=full

