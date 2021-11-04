"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
" ====================================
" ~/.config/nvim/init.vim - Paul Zupan

autocmd BufWritePre * :%s/\s\+$//e

call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox

highlight Normal guibg=none

let g:airline_powerline_fonts = 1

set expandtab
set noshowmode
set number
set relativenumber
set scrolloff=8
set shiftwidth=4
set smartindent
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set termguicolors

nnoremap <C-b> :NERDTreeToggle<CR>
