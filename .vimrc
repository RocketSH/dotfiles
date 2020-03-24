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

inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> :update<cr>
nnoremap <C-p> :Files<cr>

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

