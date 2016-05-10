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
set title               " set the title of the window to the file
set visualbell
set noerrorbells
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ttyfast             " smoother performance since we are using modern terminals
" Status Line
" We no longer use this status line. However it is a good fallback in case
" vim-airline breaks.
"set laststatus=2                " Always show status bar
"set statusline+=%<%F            " Full File path
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
                                " Display file encoding and format
"set statusline+=%h%m%r%y        " Various metadata
"set statusline+=%=              " Begin Right aligned block
"set statusline+=%{TagName()}    " Display current tag through Ctags
"set statusline+=\ %c,%l/%L\ %P  " File Nav info

"---------------------
" Behaviors
"---------------------
set nobackup
set autoread            " automatically reload file changes if detected
set backspace=indent,eol,start
set showcmd             " show incomplete commands at : prompt
set hidden              " change buffer - without saving
set clipboard+=unnamed,unnamedplus
set modeline            " allow per-file settings via mode line
set nobomb              " no byte order mark at start of file
set history=768
set viminfo='50,n$VIMFILES/viminfo
set ttimeout
set timeoutlen=1200     " time to wait for a command (e.g., after a leader)
set ttimeoutlen=50      " make <esc> work faster
set scrolloff=1
set sidescrolloff=3     " keep 3 lines below the last line when scrolling
set wildmenu
set wildmode=longest,list
set wildignore+=*.o,*.obj,*.bak,*.exe,*.a,*.lib,*.pyc,*.class
set wildignore+=.git,.DS_Store,.svn,*.swp,*.tmp
set fileformats=mac,dos,unix
set nostartofline       " don't go to start of line after some scroll commands
set nojoinspaces        " use one space, not two after punctuation
set lazyredraw          " delay redrawing screen during macros - performance boost

"---------------------
" Search options
"---------------------
set ignorecase          " case insensitive search
set smartcase           " search string determines case matching
set incsearch           " incremental search
set hlsearch            " highlight search results
set gdefault            " make search/replace global by default
set iskeyword+=\$,-     " add extra characters that are valid parts of vars
set nowrapscan          " search doesn't wrap around EOF
" toggles highlighting of search
noremap <silent> <leader><space> :set hlsearch!<cr>
" Ctrl-l to turn off higlighting and repaint
noremap <silent> <C-l> :nohlsearch<cr><C-l>
" mark position before search (mark "s")
nnoremap / ms/

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

autocmd filetype c,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype make setlocal noexpandtab

"---------------------
" GUI features
"---------------------
set winaltkeys=no       " turn off stupid fucking alt shortcuts
if has('mouse')
  set mouse=a           " mouse in all modes
endif
set nomousehide         " don't hide the mouse cursor while typing
set nocursorline
set guifont=Sauce\ Code\ Powerline:h11
if has('gui_running')
  if has("gui_macvim")
    set macmeta
    "set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    "set guifont=Lucida_Sans_Typewriter:h10
    "set guifont=DejaVu_Sans_Mono:h10
    set guifont=Consolas:h11:cANSI
  endif
endif

" only remap escape keys and cursorline if in a gui or good terminal
if has('gui_running') || $TERM =~ '-256color'
  " jk in insert mode to replace <esc>
  inoremap jk <esc>
  inoremap kj <esc>
  inoremap <esc> <nop>
  inoremap <F1> <nop>

  set cursorline
  "set cursorcolumn
endif

" --- Set the colorscheme
"  Toggle thie to 'light' for light colorschemes
set background=dark
if $TERM =~ '-256color'
  set t_Co=256
endif

try
  colorscheme monokai
"  colorscheme dracula
"  colorscheme jellybeans
"  colorscheme solarized
"  colorscheme molokai
"  colorscheme vividchalk
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

cnoremap cwd lcd %:p:h

"---------------------
" Autocommands
"---------------------
augroup vimrcEx
  " Reset autocmds
  " When a vimrc is sourced, the autocommands may be added again. Hence, clear
  " all the autocommands before defining any of our own
  autocmd!

  " always switch to the current file directory
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " auto save buffer
  "autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent ! wa
augroup END

"---------------------
" Buffer commands
"---------------------
" buffer access mappins (don't us '\p' because a delay
" before pressing 'p' would accidentally paste).
" \l        : list buffers
" \b \f \g  : go back, forwared, last-used
" \1 \2 \3  : go to buffer 1, 2, 3, etc.
nnoremap <leader>l :ls<cr>
nnoremap <leader>p :bprev<cr>
nnoremap <leader>f :bnext<cr>
nnoremap <leader>g :e#<cr>
nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>

" close the current buffer and go to previous one
nnoremap <leader>bq :bp <bar> bd #<cr>

" list buffers with ability to select one in command line
nnoremap <F5> :buffers<cr>:buffer<space>

"---------------------
" Window commands
"---------------------
" More natural to split panes to right and bottom
set splitbelow splitright

" split window horizontally or veritcally *and* switch to the new split
nnoremap <silent> <leader>hs :split<bar>:wincmd j<cr>
nnoremap <silent> <leader>vs :vsplit<bar>:wincmd l<cr>

" close the current window
nnoremap <silent> <leader>sc :close<cr>

" navigate splits with g command prepended to the analogous vim motion
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
" maximize window height, width
nnoremap <silent> gH <C-w>_
nnoremap <silent> gV <C-w><bar>

" resize windows veritcally or horizontaly
nnoremap - <C-w>-
nnoremap + <C-w>-
nnoremap <S-A-<> <C-w><
nnoremap <S-A->> <C-w>>

"---------------------
" Tab commands
"---------------------
nnoremap <leader>T :enew<cr>

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
