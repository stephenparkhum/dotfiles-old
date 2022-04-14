"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                         ██████╗  ██████╗  
"                         ██╔═══╝  ██╔══██╗
"                         ██████╗  ██████╔╝
"                             ██║  ██╔═══╝
"                         ██████║  ██║  
"                         ╚═════╝  ╚═╝  
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"GENERAL SETTINGS ---------------------------------------------------------------- {{{
"

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Hopefully fixing som eicon issues
set encoding=UTF-8

set textwidth=80

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Switch between case sensitive and insensitive automatically during search 
set smartcase

" Automatically change directory 
set autochdir

" Backspace through anything
set backspace=indent,eol,start

" Set clipboard to system clipboard to allow proper copying & pasting
set clipboard=unnamedplus

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Set splits to open below and on the right-side 
set splitbelow splitright

let mapleader=" "

" show the mathing brackets
set showmatch

" highlight current line
set cursorline

set scrolloff=8
set number
set relativenumber 
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set colorcolumn=100 
set tabstop=4 softtabstop=4

highlight ColorColumn ctermbg=0 guibg=lightgrey 

" }}}

"PLUGINS ---------------------------------------------------------------- {{{
"
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'ryanoasis/vim-devicons'
call plug#end()

" linting items 
"
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

autocmd BufWritePre *.js Neoformat


" }}}

" MAPPINGS ------------------------------------------------------------ {{{

" NORMAL Mode

" Navigates between window splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>pv :Vex<CR> 
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>s :w<CR>
nnoremap J 5j<CR>
nnoremap K 5k<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" INSERT Mode
inoremap jk <esc>

" }}}

" THEME --------------------------------------------------------------- {{{
"
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}
