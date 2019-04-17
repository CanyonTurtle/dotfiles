
" this file is for settings not associated with any particular plugin.


" ============== GENERAL SETTINGS ============== "

set number norelativenumber " numbering
set wildchar=<Tab> wildmenu wildmode=full " wildmenu options
set ignorecase " search ignore case
set hidden " don't have to save buffers to move from them.
command! -nargs=0 Light set background=light " fast way to change between light and dark modes.
command! -nargs=0 Dark set background=dark
set timeoutlen=350 " faster reaction time to commands, but harder to enter
set splitbelow " better window nav
set splitright " better window nav
set lazyredraw " SPEED
set regexpengine=1 " SPEED

" netrw
let g:netrw_liststyle = 0
let g:netrw_banner = 0

" ====================== MAPPINGS ==================

" favorite mappings
inoremap jk <ESC>
inoremap jl <ESC>:w<CR>
noremap ; :
noremap : ;


" change directory to the current file
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" faster make
noremap <leader>m :make<CR>

" cycle through tabs with alt-h and alt-l
noremap <M-l> :tabnext<CR>
noremap <M-h> :tabprevious<CR>

" fast vimrc reload"
noremap <C-F5> :e ~/.dotfiles/vimrc.vim<CR>
noremap <F5> :w<CR> :so ~/.dotfiles/vimrc.vim<CR>

" exit terminal mode cooler
tnoremap jk <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h

" ======================= COLORING ======================== "

" entry colorscheme
set background=dark
colorscheme PaperColor

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

" my set of preferrable colors
let colors = [ '256_noir', 'Bgreen', 'PaperColor', 'dank-neon', 'gruvbox', 'hashpunk', 'hashpunk-lapis', 'hashpunk-sweet', 'material-monokai', 'monokai', 'solarized8', 'vim-material'] 

" normalizes the looks across different color schemes.
function! SimpleColors ()
  hi StatusLine gui=NONE guibg=NONE 
  hi StatusLineNC gui=NONE guibg=NONE 
  hi LineNr guibg=NONE 
  hi VertSplit guibg=bg guifg=bg
endfunction

" fun: pick a random color
function! RandomColor()
  execute 'colorscheme '.g:colors[(system('/bin/bash -c "echo -n $RANDOM"') % len(g:colors))] 
  call SimpleColors()
endfunction

autocmd BufEnter * call SimpleColors()

" more coloring fixes for the
set t_Co=256
syntax enable
" coloring based on time of day
if strftime("%H") < 18 && strftime("%H") > 7
  set background=light
else
  set background=dark
endif

" ===================== UTILITIES ==================== "

" header guards on  file
function HG()
  exec "norm ggO\<Esc>" 
  exec "r !echo %" 
  exec "norm ggjveyk^p^vegUA_HjkI#ifndef jkVyp^cW#definejkGo#endifjkggjjdd"
endfunction

" construct CPP syntax from a well-formed header file.
function CPP()
  exec "r %:r.h" 
  exec "norm ggd/class\<CR>ddGd?};\<CR>ddggOjk" 
  exec "r !echo %:r.h" 
  exec "norm! I#include \"\<esc>A\"\<esc>gg=G/public:\<cr>" 
  exec "norm! dd^ve\"uy" 
  exec '%s/\([^ (]*(\)/' . @u . '::\1/g' 
  exec '%s/);/) {\r\r}/g' 
  exec "norm! G?}\<cr>jdG"
endfunction
