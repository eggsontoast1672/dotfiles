" ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
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

colorscheme gruvbox

nnoremap <C-b> :NERDTreeToggle<CR>

