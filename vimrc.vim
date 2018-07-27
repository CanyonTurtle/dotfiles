

" ================= PLUGIN INSTALLATION ================ "




call plug#begin('~/vim/plugged')

" Standard vim defaults
Plug 'https://github.com/tpope/vim-sensible'

" surround.vim
Plug 'tpope/vim-surround'

" vim git stuff
Plug 'tpope/vim-fugitive'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" the 'ranger' file browser integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" tmux and vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Auto-completion (haven't figured out yet)
" Plug 'Valloric/YouCompleteMe'

" Syntax support for lots of languages
Plug 'sheerun/vim-polyglot'

" detect indents automatically
Plug 'https://github.com/tpope/vim-sleuth'

" indentation
Plug 'Yggdroot/indentLine'

" Color schemes
Plug 'neutaaaaan/iosvkem'
" Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'CanyonTurtle/material.vim'
Plug 'dikiaap/minimalist'

" commenting
Plug 'scrooloose/nerdcommenter'

" Tabs
Plug 'gcmt/taboo.vim'

" Deoplete
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
els
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/deoplete.nvim'

Plug 'zchee/deoplete-clang'

" Deoplete for javascript
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" buffers in lines
Plug 'bling/vim-bufferline'

" NERD tree
Plug 'scrooloose/nerdtree'

" rainbow parenthesis
Plug 'luochen1990/rainbow'
 
" minimal mode
Plug 'junegunn/goyo.vim'

call plug#end()


" ============ PLUGIN FIXES =========== "


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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'

"------ hybrid material -------

" font fixes
" let g:enable_bold_font = 1
"let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1

" ----- material ------
"
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

" themes are default, dark, & palenight
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

" close if only one remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----- Rainbow Parenthesis -----"

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ----- clang deoplete -----"
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" ============== GENERAL SETTINGS ============== "

" favorite keybinds
inoremap jk <ESC>
noremap ; :
noremap : ;

" coloring
syntax enable
set background=dark
colorscheme material

" Fixing indentation
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" numbering
:set number

" wildmenu options
set wildchar=<Tab> wildmenu wildmode=full

" search ignore case" 
set ignorecase

" change directory to the current file
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" prepare buffers to easily switch to one
nnoremap <Leader>b :ls<CR>:b<Space>

" faster reaction time to commands, but harder to enter
set timeoutlen=200

" switch buffers insanely fast using tab/number

" cycle through buffers
noremap gb :bnext<CR>
set hidden

" nerdtree on start
" autocmd vimenter * NERDTree

" nerdtree change dir.

" Distraction free mode.
noremap <leader>z :Goyo 120<CR>

" best buffer switching
" function CannonSB(bufToGo)
" 	execute "b" . a:bufToGo
" endfunction

noremap <Tab> :<C-U>execute "buffer ".v:count<CR>
