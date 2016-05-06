set nocompatible
filetype off
filetype plugin indent on

if has('win32') || has('win64')
  let $VIMFILES=$HOME . "/vimfiles"
else
  let $VIMFILES=$HOME . "/.vim"
endif

" Note: this line MUST come before any <leader> mappings
"set mapleader=","       " leader character, \ by default
"set localmapleader="\\"

" --- Load plugins ---
if filereadable(expand("$HOME/.vimrc.bundles"))
  source $HOME/.vimrc.bundles
endif

"---------------------
" UI
"---------------------
set ruler
set number              " absolute line numbers
set relativenumber      " plus relative line numbers
set nowrap              " line wrapping off
set laststatus=2        " always show the statusline
"set cmdheight=2         " make command area 2 lines high
set noshowmode          " don't show the mode since airline shows it
set title               " set the title of the window to the file
set visualbell
set noerrorbells
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ttyfast             " smoother performance since we are using modern terminals

"---------------------
" Behaviors
"---------------------
set nobackup
set autoread            " automatically reload file changes if detected
set wildmenu
set backspace=indent,eol,start
set showcmd             " show incomplete commands at : prompt
set hidden              " change buffer - without saving
set clipboard+=unnamed,unnamedplus
set modeline            " allow per-file settings via mode line
set nobomb              " no byte order mark at start of file
set history=768
set ttimeout
set timeoutlen=1200     " time to wait for a command (e.g., after a leader)
set ttimeoutlen=50      " make <esc> work faster
set scrolloff=1
set sidescrolloff=3     " keep 3 lines below the last line when scrolling
set wildmode=longest:full,full
set fileformats=mac,dos,unix
set nostartofline       " don't go to start of line after some scroll commands
set nojoinspaces        " use one space, not two after punctuation

"---------------------
" Search options
"---------------------
set ignorecase          " case insensitive search
set smartcase           " search string determines case matching
set incsearch           " incremental search
set hlsearch            " highlight search results
set gdefault            " make search/replace global by default
set iskeyword+=\$,-     " add extra characters that are valid parts of vars
set wildignore+=*.o,*.obj,*.bak,*.exe,*.a,*.lib,*.pyc,*.class
set wildignore+=.git,.DS_Store,.svn,*.swp,*.tmp
" toggles highlighting of search
noremap <silent> <leader><space> :set hlsearch!<cr>
" Ctrl-l to turn off higlighting and repaint
noremap <silent> <C-l> :nohlsearch<cr><C-l>
" highlight search word under cursor without jumping to next
nnoremap * *``

"---------------------
" Text/Programming features
"---------------------
syntax enable
set autoindent
set smartindent         " indents after <cr> appropriately
set shiftwidth=2 tabstop=2 softtabstop=2
set shiftround          " round indent to multiple of shiftwidth
set smarttab
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set formatoptions+=j
set nrformats -=octal
set nofoldenable        " I fucking hate code folding
set complete -=i        " searching includes can be slow, so don't
set showmatch           " highlights matching bracket
set matchtime=4         " tenths of second to show matching parens
set matchpairs+=<:>     " adds < > to bracket list
set tildeop             " use ~ to toggle case as operator, not a motion
set tags=./tags,tags;$HOME
"set list listchars=tab:»·,trail:·,nbsp:·,extends:>,precedes:<

set cindent             " c
set cinkeys-=0#         " let #define, #pragma directives appear at any column
autocmd filetype c,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab

"---------------------
" GUI features
"---------------------
set winaltkeys=no       " turn off stupid fucking alt shortcuts
set guifont=Sauce\ Code\ Powerline:h11
if has('mouse')
  set mouse=a           " mouse in all modes
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
if $TERM =~ '-256color'
  set t_Co=256
endif

try
   colorscheme monokai
"    colorscheme dracula
"    colorscheme jellybeans
"    colorscheme solarized
"    colorscheme molokai
catch
endtry
" mark the 80th column
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
endif

"---------------------
" Misc mappings
"---------------------
" reload ~/.vimrc
noremap <leader>rc :source $MYVIMRC<cr>

" help system
nnoremap <M-F1> :helptags $VIMFILES/doc
nnoremap <C-F1> :execute "help " . expand("<cword>")<cr>:w
noremap <silent> <F1> <nop>


" jk in insert mode to replace <esc>
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <F1> <nop>

" make Y behanve like other capital commands
noremap <silent> Y y$

" make movement to beginning/endo of line easier
nnoremap H ^
nnoremap L $

" use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" swap implementations of ` and ' jump-to markers
" by default, ' jumps to the marked line, ` jumps to the mark line and column
nnoremap ' `
nnoremap ` '

" select entire buffer (like Ctrl-A)
nnoremap vy ggVG

" underline a line with hyphens
noremap <leader>- yypVr-
" underline a line with equals
noremap <leader>= yypVr=

" surround word with " or ':w
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" use <tab> to indent in visual mode
vnoremap <Tab> >'<0v'>$
vnoremap <S-Tab> <'<0v'>$

" tag navigation
nnoremap <C-}> :tnext<cr>
nnoremap <C-{> :tprev<cr>

" sort selection
noremap <leader>S :sort<cr>

" break a comma-delimited list onto new lines
vnoremap <leader>, :s/,/,\r/g<cr>

" create newlines without entering insert mode
"nnoremap go o<esc>k
"nnoremap gO O<esc>j

" command line editing
map <C-k> :<Up>
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>

"---------------------
" Autocommands
"---------------------
" always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" auto save buffer
"autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent ! wa

"---------------------
" Window commands
"---------------------
" More natural to split panes to right and bottom
set splitbelow
set splitright

" navigate splits by adding the Ctrl-modifier to the analogous vim motion
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
nnoremap <silent> gh :wincmd h<cr>
nnoremap <silent> gj :wincmd j<cr>
nnoremap <silent> gk :wincmd k<cr>
nnoremap <silent> gl :wincmd l<cr>
" move and maximize window
nnoremap <M-j> <C-w>j<C-w>_
nnoremap <M-k> <C-w>k<C-w>_

" go to previous, top left, bottom right window; cycle through windows
nnoremap <silent> gp :wincmd p<cr>
nnoremap <silent> gt :wincmd t<cr>
nnoremap <silent> gb :wincmd b<cr>
nnoremap <silent> gw :wincmd w<cr>

" equal size windows
nnoremap <silent> g= :wincmd =<cr>
" swap windows
nnoremap <silent> gx :wincmd x<cr>

" split window horizontally or veritcally *and* switch to the new split
nnoremap <silent> <leader>hs :split<bar>:wincmd j<cr>
nnoremap <silent> <leader>vs :vsplit<bar>:wincmd l<cr>

" resize windows veritcally or horizontaly
nnoremap - <C-w>-
nnoremap + <C-w>-
nnoremap <A-S-<> <C-w><
nnoremap <A-S->> <C-w>>

" close the current window
nnoremap <silent> <leader>sc :close<cr>

"---------------------
" Buffer commands
"---------------------
nnoremap <C-Tab> :bnext<cr>
nnoremap <C-S-Tab> :bprev<cr>

"---------------------
" Abbreviations/Typo fixes
"---------------------
iabbrev teh the
iabbrev tehn then
iabbrev #i #include
iabbrev #d #define
iabbrev ddate <C-r>=strftime("%Y-%m-%d")<cr>

cnoremap w' w<cr>

" disable the ever-annoying Ex mode shortcut key. make Q repeat the last macro
" instead.
nnoremap Q @@

" remove doc lookup maping because it's easy to fat finger and never useful
nnoremap K k
vnoremap K k


"---------------------
" .vim.local file sourcing
"---------------------
let s:localvim = findfile(".vim.local", ".;")
if s:localvim != ''
  execute "source " . s:localvim
endif


"vim:ft=vim ts=2 sw=2 tw=2
