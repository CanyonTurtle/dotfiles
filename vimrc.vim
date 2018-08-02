

" ================= PLUGIN INSTALLATION ================ "


call plug#begin('~/vim/plugged')

" Standard vim defaults
Plug 'https://github.com/tpope/vim-sensible'

" library of vimscripts
Plug 'xolox/vim-misc'

" ctags generation
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" surround.vim
Plug 'tpope/vim-surround'

" vim git stuff
Plug 'tpope/vim-fugitive' " git control in vim
Plug 'airblade/vim-gitgutter' " git in side.

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" the 'ranger' file browser integration
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'

" tmux and vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Syntax support for lots of languages
Plug 'sheerun/vim-polyglot'

" detect indents automatically
Plug 'https://github.com/tpope/vim-sleuth'

" indentation
Plug 'Yggdroot/indentLine'

" Color schemes
" Plug 'neutaaaaan/iosvkem'
" Plug 'CanyonTurtle/material.vim'
" Plug 'dikiaap/minimalist'
Plug 'hzchirs/vim-material'

" commenting
Plug 'scrooloose/nerdcommenter'

" Tabs
" Plug 'gcmt/taboo.vim'

" Deoplete
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete.nvim'

" Plug 'zchee/deoplete-clang'

" Deoplete for javascript
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" buffers in lines
" Plug 'bling/vim-bufferline'

" NERD tree
Plug 'scrooloose/nerdtree'

" rainbow parenthesis
Plug 'luochen1990/rainbow'

" minimal mode
Plug 'junegunn/goyo.vim'

" tmux shares airline theme
" Plug 'edkolev/tmuxline.vim'

" airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

call plug#end()





" ============ PLUGIN SETTINGS AND MAPPINGS =========== "




"----- Deoplete -----
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

"----- fuzzy finder--------

" reveal dotfiles
let g:ctrlp_show_hidden = 1

" ignore directories where I expect lots of junk
let g:ctrlp_custom_ignore = '.exe\|bin\|node_modules\|DS_Store\|\.git'

if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 <
	"https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
"  https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
"  >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) <
"  https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
"  >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
"  >
if (has("termguicolors"))
	set termguicolors
endif

" themes are default, dark, palenight, and black
let g:material_theme_style = 'black'
let g:material_terminal_italics = 0

"---- Vim Sleuth ----"
autocmd BufEnter * :Sleuth

"----- Vim Tmux Navigator -----"

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

"----- Vim Fugitive -----"
nnoremap <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>w :Gw<CR>
nnoremap <Leader>a :Gwrite .<CR>

" ----- Nerd Commenter -----"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ----- NERDTree ------ "

" opening hotkey
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw=1

" open a nerdtree buffer intended as the folder opener.
noremap <C-o> :e ~/<CR>/Bookmarks<CR>j:noh<CR>^
command! Ctrlo :norm <C-o>

" nerdtree on start
" autocmd vimenter * NERDTree

" close if only one remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----- Rainbow Parenthesis -----"

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ----- clang deoplete ----- "
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" ----- Airline ------ "
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='atomic'

" let g:airline#extensions#tmuxline#enabled = 1

" ----- Material ----- "
let g:material_style='palenight'


" ----- Tagbar ----- "
noremap <F8> :TagbarToggle<CR>

" ----- Goyo ----- "
noremap <leader>z :Goyo<CR>




" ============== GENERAL SETTINGS AND MAPPINGS ============== "




" favorite mappings
inoremap jk <ESC>
inoremap jl <ESC>:w<CR>
noremap ; :
noremap : ;

" coloring
" set t_Co=256
syntax enable
set background=dark
colorscheme vim-material

" Fixing indentation
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" numbering
:set number

" wildmenu options
set wildchar=<Tab> wildmenu wildmode=full

" search ignore case
set ignorecase

set hidden

" change directory to the current file
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" prepare buffers to easily switch to one
nnoremap <Leader>b :ls<CR>:b<Space>

" faster reaction time to commands, but harder to enter
set timeoutlen=200

" cycle through buffers
noremap gb :bnext<CR>

" switch buffers insanely fast using tab/number
" press a number and then tab to move directly to that buffer.
noremap <Tab> :<C-U>execute "buffer ".v:count<CR>

noremap <leader>m :make<CR>

" cycle through tabs with alt-h and alt-l
noremap <M-l> :tabnext<CR>
noremap <M-h> :tabprevious<CR>
