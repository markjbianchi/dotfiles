" Preamble ---------------------------------------------------------------
set nocompatible
filetype off
filetype plugin indent on

if has('win32') || has('win64')
  let $VIMFILES=$HOME . "/vimfiles"
else
  let $VIMFILES=$HOME . "/.vim"
endif

" Note: this line MUST come before any <LEADER> mappings
"set mapleader=","       " leader character, \ by default
"set localmapleader="\\"

" Load plugins -----------------------------------------------------------
if filereadable(expand("$HOME/.vimrc.bundles"))
  source $HOME/.vimrc.bundles
endif

" Basic options ----------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set modeline            " allow per-file settings via mode line
set autoindent
set showcmd             " show incomplete commands at : prompt
set hidden              " change buffer - without saving
set visualbell
set noerrorbells
set ttyfast             " smoother performance since we are using modern terminals
set backspace=indent,eol,start
set ruler
set number              " absolute line numbers
set relativenumber      " plus relative line numbers
set laststatus=2        " always show the statusline
set history=768
"set list                " shows unprintable chars
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw          " delay redrawing screen during macros - performance boost
set matchtime=3         " tenths of second to show matching parens
set showbreak=↪         " char to put at start of lines that have been wrapped
set title               " set the title of the window to the file
set autoread            " automatically reload file changes if detected
set clipboard+=unnamed,unnamedplus
set nobomb              " no byte order mark at start of file
set viminfo='50,n$VIMFILES/viminfo
set ttimeout
set ttimeoutlen=50      " make <ESC> work faster
set timeoutlen=1200     " time to wait for a command (e.g., after a leader)
set scrolloff=3         " keep 3 lines above/below the cursor when scrolling
set sidescrolloff=7     " keep 7 columns to left/right of cursor when scrolling
set sidescroll=1        " minimum of 1 column to scroll
set fileformats=mac,dos,unix
set nostartofline       " don't go to start of line after some scroll commands
set nojoinspaces        " use one space, not two after punctuation

" Wildmenu completion ----------------------------------------------------
set wildmenu
set wildmode=list:longest
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.a,*.exe,*.dll,*.lib,*.pyc,*.class
set wildignore+=.DS_Store,.*.sw?,*.tmp,*.bak

" Search options ---------------------------------------------------------
set ignorecase          " case insensitive search
set smartcase           " search string determines case matching
set incsearch           " incremental search
set nohlsearch          " turn off highlight search results
set gdefault            " make search/replace global by default
set iskeyword+=\$,-     " add extra characters that are valid parts of vars
set wrapscan            " search wraps around EOF
" Toggles highlighting of search
noremap <LEADER><SPACE> :set hlsearch!<CR>
" Ctrl-l to turn off higlighting and repaint
noremap <C-L> :nohlsearch<CR><C-L>
" Use python/java regex search and mark position before search (mark 's')
nnoremap / ms/\v
vnoremap / ms/\v

" Text/Programming features ----------------------------------------------
syntax enable
set smartindent         " indents after <CR> appropriately
set shiftwidth=2 tabstop=2 softtabstop=2
set shiftround          " round indent to multiple of shiftwidth
set smarttab
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set formatoptions+=j
set nrformats -=octal
set nofoldenable        " I fucking hate code folding
set complete -=i        " searching includes can be slow, so don't
set showmatch           " highlights matching bracket
set matchpairs+=<:>     " adds < > to bracket list
set tildeop             " use ~ to toggle case as operator, not a motion
set tags=./tags,tags;$HOME

" Various things seem to turn off syntax highlighting, so make a quick toggle
nnoremap <LEADER>X :syntax on<CR>

" Toggle [N]on-printable characters
nnoremap <LEADER>N :set list!<CR>

autocmd filetype c,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab

" Backups ----------------------------------------------------------------
set noswapfile
set backup
set undodir=$VIMFILES/tmp/undo//
set backupdir=$VIMFILES/tmp/backup//
set directory=$VIMFILES/tmp/swap//
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" UI ---------------------------------------------------------------------
set nowrap                " line wrapping on
nnoremap <F2> :set wrap!<CR>
"set cmdheight=2         " make command area 2 lines high
set termencoding=utf-8
set splitbelow splitright " More natural to split windows to right and bottom
" Resize splits when the window is resized
au VimResized * :wincmd =
" Status Line
" We no longer use this status line. However it is a good fallback in case
" vim-airline breaks.
"set laststatus=2                " Always show status bar
"set statusline+=%<%F            " Full File path
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]  Display file encoding and format
"set statusline+=%h%m%r%y        " Various metadata
"set statusline+=%=              " Begin Right aligned block
"set statusline+=%{TagName()}    " Display current tag through Ctags
"set statusline+=\ %c,%l/%L\ %P  " File Nav info

" GUI features -----------------------------------------------------------
set winaltkeys=no       " turn off stupid fucking alt shortcuts
if has('mouse')
  set mouse=a           " mouse in all modes
endif
set nomousehide         " don't hide the mouse cursor while typing
set guifont=Sauce\ Code\ Powerline:h11
if has('gui_running')
  if has("gui_macvim")
    set macmeta                       "Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI    "Lucida_Sans_Typewriter:h10 DejaVu_Sans_Mono:h10
  endif
endif

" Only remap escape keys and cursorline if in a gui or good terminal
if has('gui_running') || $TERM =~ '-256color'
  inoremap jk <ESC>
  inoremap <ESC> <NOP>
endif

" Only show cursorline in the current window and in normal mode
augroup cursline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END

" --- Set the colorscheme
" Toggle thie to 'light' for light colorschemes
set background=dark
if $TERM =~ '-256color'
  set t_Co=256
endif

try
  colorscheme monokai   "monokai molokai dracula jellybeans solarized vividchalk
catch
endtry
if (exists('+colorcolumn'))
  set colorcolumn=80            " mark the 80th column
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
endif

" Convenience mappings ---------------------------------------------------
" Reload ~/.vimrc
noremap <LEADER>rc :source $MYVIMRC<CR>

" Help system
nnoremap <M-F1> :helptags $VIMFILES/doc<CR>
nnoremap <C-F1> :execute "help " . expand("<CWORD>")<CR>:w
noremap <SILENT> <F1> <NOP>

" Make Y and D behanve like other capital commands
noremap <SILENT> Y y$
noremap <SILENT> D d$

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Make movement to beginning/endo of line easier
nnoremap H ^
nnoremap L $

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Swap implementations of ` and ' jump-to markers
" By default, ' jumps to the marked line, ` jumps to the mark line and column
nnoremap ' `
nnoremap ` '

" Select entire buffer (like Ctrl-A)
nnoremap vy ggVG

" Underline a line with hyphens
noremap <LEADER>- yypVr-
" Underline a line with equals
noremap <LEADER>= yypVr=

" Surround word with " or ':w
nnoremap <LEADER>" viw<ESC>a"<ESC>hbi"<ESC>lel
nnoremap <LEADER>' viw<ESC>a'<ESC>hbi'<ESC>lel

" Use <tab> to indent in visual mode
vnoremap <Tab> >'<0v'>$
vnoremap <S-Tab> <'<0v'>$

" Tag navigation
nnoremap <C-}> :tnext<CR>
nnoremap <C-{> :tprev<CR>

" Break a comma-delimited list onto new lines
vnoremap <LEADER>, :s/,/,\r/g<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Create newlines without entering insert mode
"nnoremap go o<ESC>k
"nnoremap gO O<ESC>j

" Command line editing
map <C-K> :<Up>
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>

" Set the working directory of that of the current file
cnoremap cwd lcd %:p:h

cnoremap w' w<CR>

" disable the ever-annoying Ex mode shortcut key. make Q repeat the last macro
" instead.
nnoremap Q @@

" remove doc lookup maping because it's easy to fat finger and never useful
nnoremap K k
vnoremap K k

" Autocommands -----------------------------------------------------------
augroup bufcmds
  au!
  " always switch to the current file directory
  au BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " auto save buffer
  "autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent ! wa
augroup END

" Buffer commands --------------------------------------------------------
" list buffers with ability to select one in command line
nnoremap <F5> :buffers<CR>:buffer<space>
" \l        : switch to last-used buffer
nnoremap <LEADER>l :e#<CR>
" close the current buffer and go to previous one
nnoremap <LEADER>bq :bp <bar> bd #<CR>

" Window commands --------------------------------------------------------
" split window horizontally or veritcally *and* switch to the new split
nnoremap <LEADER>hs :split<bar>:wincmd j<CR>
nnoremap <LEADER>vs :vsplit<bar>:wincmd l<CR>
" close the current window
nnoremap <LEADER>sc :close<CR>

" navigate splits with g command prepended to the analogous vim motion
nnoremap gh :wincmd h<CR>
nnoremap gj :wincmd j<CR>
nnoremap gk :wincmd k<CR>
nnoremap gl :wincmd l<CR>
" move and maximize window
nnoremap <M-j> <C-W>j<C-W>_
nnoremap <M-k> <C-W>k<C-W>_

" go to previous, top left, bottom right window; cycle through windows
nnoremap gp :wincmd p<CR>
nnoremap gt :wincmd t<CR>
nnoremap gb :wincmd b<CR>
nnoremap gw :wincmd w<CR>

" equal size windows
nnoremap g= :wincmd =<CR>
" swap windows
nnoremap gx :wincmd x<CR>
" maximize window height, width
nnoremap gH <C-W>_
nnoremap gV <C-W><BAR>

" resize windows vertically or horizontally
nnoremap - <C-W>-
nnoremap + <C-W>+
nnoremap <S-A-<> <C-W><
nnoremap <S-A->> <C-W>>

" Tab commands -----------------------------------------------------------
nnoremap <LEADER>T :tabnew<CR>

" Abbreviations/Typo fixes -----------------------------------------------
iabbrev teh the
iabbrev tehn then
iabbrev #i #include
iabbrev #d #define
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" .vim.local file sourcing -----------------------------------------------
let s:localvim = findfile(".vim.local", ".;")
if s:localvim != ''
  execute "source " . s:localvim
endif

"vim:ft=vim ts=2 sw=2 tw=2
