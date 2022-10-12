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

" text editing
Plug 'tpope/vim-surround'                               " better brackets
Plug 'tpope/vim-commentary'                             " comments
Plug 'tpope/vim-abolish'                                " coerce camelCase / snake_case
Plug 'Raimondi/delimitMate', { 'on': [] }               " closing brackets
Plug 'alvan/vim-closetag', { 'on': [] }                 " closing tags
Plug 'terryma/vim-expand-region'                        " change visual selection by using '+' / '-'
Plug 'nathanaelkane/vim-indent-guides'                  " indent columns
Plug 'w0rp/ale', { 'on': [] }                           " lint
Plug 'jiangmiao/auto-pairs'
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" vim
Plug 'nvim-lua/plenary.nvim'
Plug 'ctjhoa/spacevim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" autocompletion
" Plug 'neoclide/coc.nvim'
Plug 'github/copilot.vim', { 'on': [] }
Plug 'SirVer/ultisnips', { 'for': ['javascript', 'jsx', 'typescript', 'typescriptreact'] }
Plug 'mlaursen/vim-react-snippets'
Plug 'ludovicchabant/vim-gutentags', { 'for': ['javascript', 'jsx', 'typescript', 'typescriptreact'] }

" css
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'

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
Plug 'tpope/vim-endwise', { 'for': ['ruby'], 'on': [] } " auto end
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }          " run rspec
Plug 'tpope/vim-bundler', { 'for': 'ruby' }             " bundle s and smart ctags
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-haml'
Plug 'ngmy/vim-rubocop'

" Testing
Plug 'vim-test/vim-test', { 'for': ['ruby', 'typescript', 'javascript', 'javascriptreact'] }

" js / jsx / ts / tsx
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'typescript', 'typescriptreact'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'jsx', 'typescriptreact'] }
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'typescriptreact', 'html'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'sass' }
Plug 'jparise/vim-graphql', { 'for': ['javascript', 'typescript', 'jsx'] }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'evanleck/vim-svelte', {'branch': 'main', 'for': 'svelte' }

" syntaxes and languages
Plug 'valloric/MatchTagAlways', { 'for': ['xml', 'html', 'eruby', 'javascript', 'javascriptreact', 'typescriptreact'] } " highlight matching tags
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
let NERDTreeShowHidden=1
let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"`", '```':'```', '"""':'"""'}

" vim-test
map <Leader>mtv :TestFile<CR>
map <Leader>mtr :TestLast<CR>
map <Leader>mta :TestSuite<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"

" coc config
" let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-stylelintplus', 'coc-rust-analyzer', 'coc-rls', 'coc-prettier', 'coc-json', 'coc-emmet', 'coc-css', 'coc-diagnostic', 'coc-snippets', 'coc-vetur', 'coc-solargraph']
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
nmap <silent> <F5> :e!<CR>

nnoremap <Space> <Nop>

inoremap <C-s> <esc>:update<cr>
nnoremap <C-s> :update<cr>
nnoremap <C-p> :Files<cr>

" folding
set foldmethod=manual

" open fern
inoremap <silent> <F9> <esc>
nnoremap <silent> <F9> :Fern . -drawer -reveal=% -toggle<CR>
map <Leader>fer :source $MYVIMRC<cr>
map <Leader>pi :PlugInstall<cr>
map <F10> :wqa<CR>

" buffer navigation
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>

" vim
map <Leader>wd :q<cr>
map <Leader>wm :only<cr>

" Neogit
map <Leader>gg :Neogit<cr>
map <Leader>gp :NeogitPushPopup<cr>

" rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Set specific linters
let g:ale_linters = { 'javascript':['eslint'], 'ruby': ['rubocop'] }
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1 
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" Disable ALE auto highlights
let g:ale_set_highlights = 0

" autocmd
augroup lazy_load_on_insert
  autocmd!
  autocmd InsertEnter * call plug#load('delimitMate', 'ale', '.nvim', 'copilot.vim')

  autocmd InsertEnter *.rb,*.ex call plug#load('vim-endwise')
  autocmd InsertEnter *.js,*.jsx,*.tsx,*.xml,*.html,*.erb,*.eex call plug#load('vim-closetag')
augroup END

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
highlight Blamer guifg=lightgrey

" status line
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_crypt = 0
let g:airline_section_y = ''
let g:airline_section_warning = ''

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = []
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" theme
colorscheme 1989
let g:airline_theme="base16"

