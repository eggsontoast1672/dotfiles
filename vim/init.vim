"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
" =================================
" ~/.config/nvim/init.vim - Paul Zupan

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set splitright
set splitbelow

set scrolloff=8
set termguicolors

colorscheme gruvbox

" Remaps
nnoremap <C-b> :NERDTreeToggle<CR>

" Funcs
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EGGSONTOAST
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" vim-airline settings
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

