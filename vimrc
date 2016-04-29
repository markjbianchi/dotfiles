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
set modeline            " allow per-file settings via mode line
set number              " line numbers
set nofoldenable        " I fucking hate code folding
set winaltkeys=no       " turn off stupid fucking alt shortcuts
set showmatch           " highlights matching bracket
set matchpairs+=<:>     " adds < > to bracket list
set matchtime=4
set hlsearch ignorecase smartcase
" toggles highlighting of search
noremap <silent> <leader>n : set hlsearch!<CR>
noremap <silent> <leader><space> : set nohlsearch<CR>
"set mapleader=",       " leader character, \ by default
set nobackup nowritebackup noswapfile
set noerrorbells
set visualbell
set hidden              " don't unload buffer when switching away
set guifont=Sauce\ Code\ Powerline:h11
set tildeop             " use ~ to toggle case as operator, not a motion
if has('mouse')
  set mouse=a
endif
set nomousehide         " don't hide the mouse cursor while typing

set ttyfast             " smoother performance since we are using modern terminals

""""""""""""""""""""""
" formatting
""""""""""""""""""""""
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set smartindent         " indents after <CR> appropriately
autocmd filetype c,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab
set cindent             " c
set cinkeys-=0#         " let #define, #pragma directives appear at any column

set tags=./tags,tags;$HOME

" ----- misc mappings ---
"helptags $VIMFILES/docs
" use 'Y' to yank to end of a line, instead of the whole line
noremap <silent> Y y$
" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sudo save
cmap w!! w !sudo tee >/dev/null %

" underline a line with hyphens
noremap <leader>- yypVr-
" underline a line with equals
noremap <leader>= yypVr=

" reload ~/.vimrc
noremap <leader>rc :source ~/.vimrc<cr>

" sort selection
noremap <leader>s :sort<cr>

" break a comma-delimited list onto new lines
vmap <leader>, :s/,/,\r/g<cr>


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
