call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'Neur1n/neuims'
call plug#end()
autocmd VimEnter * IMSToggle
noremap a h
noremap s j
noremap d l
noremap w k
noremap W 5k
noremap S 5j
noremap A 0
noremap D $
noremap h w
noremap k a
inoremap jj <ESC>