if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle','NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctjhoa/spacevim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
call plug#end()

syntax on
set number
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set eol
set autoread
set noswapfile

if (has("termguicolors"))
  set termguicolors
endif

let mapleader = " "
let NERDTreeMinimalUI=28
let NERDTreeDirArrows=1

nnoremap <Space> <Nop>

inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> :update<cr>
nnoremap <C-p> :Files<cr>
map <F9> :NERDTreeToggle<cr>
map <F10> :wqa<CR>

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

