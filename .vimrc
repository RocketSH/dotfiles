if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" navigation
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle','NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'Konfekt/FastFold'

" text editing
Plug 'tpope/vim-surround'                               " better brackets
Plug 'tpope/vim-commentary'                             " comments
Plug 'tpope/vim-abolish'                                " coerce camelCase / snake_case
Plug 'tpope/vim-haml'
Plug 'Raimondi/delimitMate', { 'on': [] }               " closing brackets
Plug 'alvan/vim-closetag', { 'on': [] }                 " closing tags
Plug 'terryma/vim-expand-region'                        " change visual selection by using '+' / '-'
Plug 'nathanaelkane/vim-indent-guides'                  " indent columns
Plug 'w0rp/ale', { 'on': [] }                           " lint
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release'} " autocomplete and LSP: -solargraph, -tsserver
Plug 'github/copilot.vim', { 'on': [] }                 " smart autocompletion

" css
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'

" vim
Plug 'nvim-lua/plenary.nvim'
Plug 'ctjhoa/spacevim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" theme
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'TimUntersberger/neogit'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" ruby / rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }             " ruby
Plug 'tpope/vim-rails', { 'for': 'ruby' }               " rails
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'], 'on': [] } " auto end
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }          " run rspec
Plug 'tpope/vim-bundler', { 'for': 'ruby' }             " bundle s and smart ctags

" js / jsx / ts / tsx
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }

" syntaxes and languages
Plug 'valloric/MatchTagAlways', { 'for': ['xml', 'html', 'eruby', 'eelixir', 'javascript', 'javascriptreact', 'typescriptreact'] } " highlight matching tags
Plug 'shime/vim-livedown', { 'for': 'markdown' }        " real time markdown editing
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
let g:coc_global_extensions = ['-solargraph']
let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"`", '```':'```', '"""':'"""'}

nnoremap <Space> <Nop>

inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> :update<cr>
nnoremap <C-p> :Files<cr>

" open fern
inoremap <silent> <F9> <esc>
nnoremap <silent> <F9> :Fern . -drawer -reveal=% -toggle<CR>
map <Leader>fer :source $MYVIMRC<cr>
map <Leader>pi :PlugInstall<cr>
map <F10> :wqa<CR>

" ffer navigation
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>

" vim
map <Leader>wd :q<cr>
map <Leader>wm :only<cr>

" Neogit
map <Leader>gg :Neogit<cr>
map <Leader>gp :NeogitPushPopup<cr>


" autocmd
augroup lazy_load_on_insert
  autocmd!
  autocmd InsertEnter * call plug#load('delimitMate', 'ale', '.nvim', 'copilot.vim')

  autocmd InsertEnter *.rb,*.ex call plug#load('vim-endwise')
  autocmd InsertEnter *.js,*.jsx,*.tsx,*.xml,*.html,*.erb,*.eex call plug#load('vim-closetag')
augroup END

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" status line
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_crypt = 0
let g:airline_section_y = ''
let g:airline_section_warning = ''

" theme
colorscheme 1989
let g:airline_theme="base16"

