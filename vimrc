" Vim-as-IDE (github.com/jez/vim-as-an-ide)
set nocompatible
filetype off
filetype plugin indent on

"let $VIMFILES=expand("$HOME") . "/.vim"

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
""inoremap <C-U> <C-G>u<C-U>
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
set hlsearch            " highlights the searched pattern
" toggles highlighting of search
noremap <silent> \n : set hlsearch!<CR>
"set mapleader=","
set smartcase
set nobackup
set noerrorbells
set visualbell t_vb=
set hidden              " not sure if I want this set
set guifont=Sauce\ Code\ Powerline:h11
set cinkeys-=0#         " let #define, #pragma directives appear at any column
"set tildeop            " use ~ to toggle case as operator, not a motion
if has('mouse')
  set mouse=a
endif

" ----- misc mappings ---
" use 'Y' to yank to end of a line, instead of the whole line
noremap <silent> Y y$
"helptags $VIMFILES/docs

" --- Set the colorscheme
try
    colorscheme solarized
"    colorscheme dracula
catch
endtry

"vim:ft=vim
