set nocompatible
filetype off
filetype plugin indent on

if has('win32') || has('win64')
  let $VIMFILES=$HOME . "/vimfiles"
else
  let $VIMFILES=$HOME . "/.vim"
endif

" --- Load plugins ---
if filereadable(expand("$HOME/.vimrc.bundles"))
  source $HOME/.vimrc.bundles
endif

""""""""""""""""""""""
" General settings
""""""""""""""""""""""
set backspace=indent,eol,start
set showcmd             " show incomplete commands at : prompt
set hidden              " don't unload buffer when switching away
set nobackup
set nowrap
set ruler
set autoread
set noerrorbells
set scrolloff=1
set sidescrolloff=5
set clipboard+=unnamed,unnamedplus
set modeline            " allow per-file settings via mode line
set visualbell
set history=1000
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nobomb
set ttimeout
set timeoutlen=1200     " a little bit more time for macros
set ttimeoutlen=50      " make <esc> work faster
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,*.o,*.obj,*.bak,*.exe,*.a,*.lib,*.pyc
set ttyfast             " smoother performance since we are using modern terminals
set fileformats=mac,dos,unix
set nojoinspaces        " use one space, not two after punctuation

"filetype plugin indent on

""""""""""""""""""""""
" search options
""""""""""""""""""""""
set incsearch
set hlsearch ignorecase smartcase
" toggles highlighting of search
noremap <silent> <leader>n :set hlsearch!<cr>
noremap <silent> <leader><space> :set nohlsearch<cr>

""""""""""""""""""""""
" useful programmming features
""""""""""""""""""""""
syntax enable
set number              " line numbers
set autoindent
set smartindent         " indents after <cr> appropriately
set shiftwidth=2 tabstop=2 softtabstop=2
set shiftround          " round indent to multiple of shiftwidth
set smarttab
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set formatoptions+=j
set nrformats-=octal
set nofoldenable        " I fucking hate code folding
set complete-=i         " searching includes can be slow, so don't
set showmatch           " highlights matching bracket
set matchtime=4         " tenths of second to show matching parens
set matchpairs+=<:>     " adds < > to bracket list
set tildeop             " use ~ to toggle case as operator, not a motion
set tags=./tags,tags;$HOME
"set list listchars=tab:»·,trail:·,nbsp:·

set cindent             " c
set cinkeys-=0#         " let #define, #pragma directives appear at any column
autocmd filetype c,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab

""""""""""""""""""""""
" GUI features
""""""""""""""""""""""
set winaltkeys=no       " turn off stupid fucking alt shortcuts
set guifont=Sauce\ Code\ Powerline:h11
if has('mouse')
  set mouse=a
endif
set nomousehide         " don't hide the mouse cursor while typing
if has('gui_running')
  if has("gui_macvim")
    "set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    "set guifont=Lucida_Sans_Typewriter:h10
    "set guifont=DejaVu_Sans_Mono:h10
    set guifont=Consolas:h11:cANSI
  endif
endif

" --- Set the colorscheme
"  Toggle thie to 'light' for light colorschemes
set background=dark
try
    colorscheme monokai
"    colorscheme dracula
"    colorscheme solarized
"    colorscheme molokai
catch
endtry

" mark the 80th column
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
endif


""""""""""""""""""""""
" misc mappings
""""""""""""""""""""""
helptags $VIMFILES/doc

"set mapleader=","      " leader character, \ by default
"set mapleader="\\"     " leader character, \ by default
"
"inoremap <C-U> <C-G>u<C-U>
" I think this copies what was just inserted
"inoremap <C-c> <esc>`^

" use 'Y' to yank to end of a line, instead of the whole line
noremap <silent> Y y$

" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sudo save
cnoremap w!! w !sudo tee >/dev/null %

" underline a line with hyphens
noremap <leader>- yypVr-
" underline a line with equals
noremap <leader>= yypVr=

" reload ~/.vimrc
noremap <leader>rc :source $MYVIMRC<cr>

" sort selection
noremap <leader>S :sort<cr>

" break a comma-delimited list onto new lines
vnoremap <leader>, :s/,/,\r/g<cr>

" move line down one or up one
nnoremap <leader>- ddP
nnoremap <leader>_ ddP

" auto save buffer
"autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent ! wa

"vim:ft=vim ts=2 sw=2 tw=2
