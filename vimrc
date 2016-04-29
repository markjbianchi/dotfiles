set nocompatible
filetype off
filetype plugin indent on

"let $VIMFILES=expand("$HOME") . "/.vim"

if has('gui_running')
endif

" --- Load plugins ---
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" --- General settings ---
"  Following commented lines (and others) are set in vim-sensible plugin
"syntax enable "set autoindent "set backspace=indent,eol,start "set complete-=i
"set smarttab "set nrformats-=octal "set ttimeout "set ttimeoutlen=100
"set incsearch "set ruler "set wildmenu "set scrolloff=1 "set sidescrolloff=5
"set display+=lastline "set encoding=utf-8 "set formatoptions+=j "set autoread
"set history=1000
"inoremap <C-U> <C-G>u<C-U>

"set wildmode=list:longest
set showcmd             " show incomplete commands at : prompt
set number              " line numbers
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set tabstop=2           " default to 2 spaces for hard tab
set softtabstop=2       " default to 2 spaces for the soft tab
set shiftwidth=2        " for when <tab> is pressed at the beginning of a line
set smartindent         " indents after <CR> appropriately
set showmatch           " highlights matching bracket
set matchpairs+=<:>     " adds < > to bracket list
set matchtime=4
"set ignorecase         " should i keep this?
"set mapleader=",       " leader character, \ by default
set hlsearch            " highlights the searched pattern
" toggles highlighting of search
noremap <silent> <leader>n : set hlsearch!<CR>
noremap <silent> <leader><space> : set nohlsearch<CR>
set smartcase
set nobackup
set noerrorbells
set visualbell t_vb=
set hidden              " not sure if I want this set
set guifont=Sauce\ Code\ Powerline:h11
set cinkeys-=0#         " let #define, #pragma directives appear at any column
set tildeop             " use ~ to toggle case as operator, not a motion
if has('mouse')
  set mouse=a
endif

set ttyfast             " smoother performance since we are using modern terminals

" ----- misc mappings ---
"helptags $VIMFILES/docs
" use 'Y' to yank to end of a line, instead of the whole line
noremap <silent> Y y$
" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Set the colorscheme
"  Toggle thie to 'light' for light colorschemes
set background=dark
try
"    colorscheme solarized
    colorscheme molokai
"    colorscheme dracula
catch
endtry

" mark the 80th column
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
endif

"vim:ft=vim
