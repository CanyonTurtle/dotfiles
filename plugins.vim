" this file is for managing plugins and their settings/mappings.

" ================= PLUGIN INSTALLATION ================ "

call plug#begin('~/vim/plugged')

" Utility
Plug 'christoomey/vim-tmux-navigator' " tmux and vim navigation
Plug 'editorconfig/editorconfig-vim' " save editor settings in-directory
Plug 'https://github.com/tpope/vim-sleuth' " detect indents automatically
Plug 'junegunn/goyo.vim' " minimal mode
Plug 'mattn/emmet-vim' " make HTML LIT
Plug 'romainl/vim-cool' "searching highlight color goes away after moving cursor.
Plug 'sheerun/vim-polyglot' " Syntax support for lots of languages
Plug 'tpope/vim-fugitive' " git control in vim
Plug 'tpope/vim-surround' " surround.vim
Plug 'xolox/vim-misc' "needed for session manager
Plug 'xolox/vim-session' " session manager
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder.
Plug 'junegunn/fzf.vim' " fuzzy finder.

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alok/notational-fzf-vim'

" COLOR SCHEMES
Plug 'abnt713/vim-hashpunk' 
Plug 'andreasvc/vim-256noir'
" Plug 'BarretRen/vim-colorscheme'
Plug 'DankNeon/vim'
Plug 'hzchirs/vim-material'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'skielbasa/vim-material-monokai'
Plug 'sonph/onehalf'
Plug 'haishanh/night-owl.vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'Yggdroot/indentLine'
call plug#end()


" ============ PLUGIN SETTINGS AND MAPPINGS =========== "


"----- Coc.vim -----

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references

"---- Vim Sleuth ----"
autocmd BufEnter * :Sleuth

"----- Vim Tmux Navigator -----"
let g:tmux_navigator_save_on_switch = 2 " Write all buffers before navigating from Vim to tmux pane

"----- Vim Fugitive -----"
nnoremap <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>w :Gw<CR>
nnoremap <Leader>a :Gwrite .<CR>

" ----- Tagbar ----- "
noremap <F8> :TagbarToggle<CR>

" ----- Goyo ----- "
noremap <leader>z :Goyo<CR>

" ----- Vim-Session ----- "
let g:session_autosave='no' " I disabled these so it's explicit when a session is in use.
let g:session_autoload='no'
let g:session_default_to_last=1
noremap <C-S> :SaveSession<CR>

" colorscheme plugins
let g:material_style='palenight' "  default, light, or palenight
let g:materialmonokai_italic=1

" ----- Coc.vim ------ "
function! GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    exec "normal! :" . prefix . "GFiles\<CR>"
  else
    exec "normal! :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

noremap <c-p> :call GFilesFallback()<CR>
noremap <F2> :call GFilesFallback()<CR>
noremap <F3> :NV<CR>
noremap <F4> :Goyo<CR>

let g:nv_search_paths = ['~/notes']
let g:nv_create_note_window = "edit"
