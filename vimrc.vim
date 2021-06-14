" this is the entry-point of all of my vim configurations.

let vimrc_dir = expand('<sfile>:p:h')

" this-machine-specific configuration.
let localvimrc = vimrc_dir . '/vimrc.vim.local'

if filereadable(localvimrc)
	exec "source " . localvimrc
endif
" plugin-specific configuration and mappings
exec "source " . vimrc_dir . "/plugins.vim"

" general configuration and mappings
exec "source " . vimrc_dir . "/general.vim"


