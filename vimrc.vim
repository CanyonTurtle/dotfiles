" this is the entry-point of all of my vim configurations.

so ./plugins.vim " plugin-specific configuration and mappings
so ./general.vim " general configuration and mappings

" this-machine-specific configuration.
let localvimrc = expand('<sfile>:p:h') . '/vimrc.vim.local'
if filereadable(localvimrc)
	exec "source " . localvimrc
endif

