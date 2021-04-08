" Preamble ---------------------------------------------------------------
set nocompatible
filetype off
filetype plugin indent on

if has('win32') || has('win64')
  let $VIMFILES=$HOME . "/vimfiles"
else
  let $VIMFILES=$HOME . "/.vim"
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
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw          " delay redrawing screen during macros - performance boost
set matchtime=3         " tenths of second to show matching parens
set showbreak=↪         " char to put at start of lines that have been wrapped
set title               " set the title of the window to the file
set autoread            " automatically reload file changes if detected
set clipboard+=unnamed,unnamedplus
set nobomb              " no byte order mark at start of file
set viminfo=h,'50,n$VIMFILES/viminfo
set ttimeout
set ttimeoutlen=50      " make <ESC> work faster
set timeoutlen=1000     " time to wait for a command (e.g., after a leader)
set scrolloff=2         " keep 2 lines above/below the cursor when scrolling
set sidescrolloff=7     " keep 7 columns to left/right of cursor when scrolling
set sidescroll=1        " minimum of 1 column to scroll
set fileformats=unix,dos
set nostartofline       " don't go to start of line after some scroll commands
set nojoinspaces        " use one space, not two after punctuation
set virtualedit=block   " Square up visual selections...

" Wildmenu completion ----------------------------------------------------
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.a,*.exe,*.dll,*.lib,*.pyc,*.class
set wildignore+=.DS_Store,.*.sw?,*.tmp,*.bak
set infercase           " adjust completions to match case

" Search options ---------------------------------------------------------
set ignorecase          " case insensitive search
set smartcase           " search string determines case matching
set incsearch           " incremental search
set nohlsearch          " turn off highlight search results
"set gdefault            " make search/replace global by default
set iskeyword+=\$,-     " add extra characters that are valid parts of vars
set wrapscan            " search doesn't stopcat EOF
" Toggles highlighting of search
noremap <LEADER><SPACE> :set hlsearch!<CR>
" Mark position before search (mark 's')
nnoremap / ms/
vnoremap / ms/
" Keep searching in the middle of the window
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz

" Remap escape key
inoremap jk <ESC>

" Text/Programming features ----------------------------------------------
syntax enable
set smartindent         " indents after <CR> appropriately
set shiftwidth=2 tabstop=2 softtabstop=2
set shiftround          " round indent to multiple of shiftwidth
set smarttab
set expandtab           " turn tabs into spaces (use <C-V>Tab to insert real tabs
set formatoptions+=j
set nrformats-=octal
set nofoldenable        " I fucking hate code folding
set complete-=i         " searching includes can be slow, so don't
set showmatch           " highlights matching bracket
set matchpairs+=<:>     " adds < > to bracket list
set tildeop             " use ~ to toggle case as operator, not a motion
set completeopt -=preview  " don't show extra info in a preview window
set tags=tags;          " default tags file name and location, .vim.local files
                        " may modify this and path setting
" Various things seem to turn off syntax highlighting, so make a quick toggle
nnoremap <LEADER>X :syntax on<CR>

" Toggle [N]on-printable characters
nnoremap <LEADER>N :set list!<CR>

" Change tabs to spaces in buffer
nnoremap <LEADER><TAB> :retab<CR>

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
nnoremap <F6> :set wrap!<CR>
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
set nomousehide         " don't hide the mouse cursor while typing
if has('mouse')
  set mouse=a           " mouse in all modes
endif
if has('gui_running')
  "set guifont=Sauce\ Code\ Powerline:h11  "Menlo\ Regular\ for\ Powerline:h12
  set guifont=JetBrains\ Mono:h12  "Menlo\ Regular\ for\ Powerline:h12
  "set guifont=Consolas:h12
  " Remove all the UI cruft from guioptions (or go)
  set go-=T       " no toolbar
  set go-=r       " no righthand scrollbar
  set go-=R       " not even when vertically split window
  set go-=l       " no lefthand scrollbar
  set go-=L       " not even when vertically split window
  set go+=d       " use dark theme variant if available
  " Different cursors for different modes.
  "set guicursor=n-c:block-Cursor-blinkon0
  "set guicursor+=v:block-vCursor-blinkon0
  "set guicursor+=i-ci:ver20-iCursor
  " hack for re-setting colorscheme because it is light when launching macvim
  nnoremap <LEADER>C :colorscheme onedark<CR>

  if has("gui_macvim")
    set macmeta
    " Full screen means FULL screen
    "set fuoptions=maxvert,maxhorz
    " Use the normal HIG movements, except for M-Up/Down
    let macvim_skip_cmd_opt_movement = 1
    no  <D-LEFT> <HOME>
    no! <D-LEFT> <HOME>
    no  <M-LEFT> <C-LEFT>
    no! <M-LEFT> <C-LEFT>

    no  <D-RIGHT> <END>
    no! <D-RIGHT> <END>
    no  <M-RIGHT> <C-RIGHT>
    no! <M-RIGHT> <C-RIGHT>

    no   <D-UP> <C-HOME>
    ino  <D-UP> <C-HOME>
    imap <M-UP> <C-O>{

    no   <D-DOWN> <C-END>
    ino  <D-DOWN> <C-END>
    imap <M-DOWN> <C-O>}

    imap     <M-BS> <C-W>
    inoremap <D-BS> <ESC>my0c`y
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI    "Lucida_Sans_Typewriter:h10 DejaVu_Sans_Mono:h10
  endif
endif

" Only show cursorline in the current window and in normal mode
augroup cursline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END

" --- Set the colorscheme
" Toggle this to 'light' for light colorschemes
set background=dark
try
  colorscheme onedark
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
nnoremap <LEADER><F1> :help mjb<CR>
nnoremap <M-F1> :execute "help " . expand("<cword>")<CR>
"nnoremap <M-F1> :helptags $VIMFILES/doc<CR>
" For when I accidentally it F1 instead of ESC, don't bring up vim help
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use <space> and ctrl-space to page down and up
"nnoremap <SPACE> <PAGEDOWN>
"vnoremap <SPACE> <PAGEDOWN>
"nnoremap <C-SPACE> <PAGEUP>
"vnoremap <C-SPACE> <PAGEUP>

" Make Y and D behave like other capital commands
noremap Y y$
noremap D d$

" Make movement to beginning/endo of line easier
nnoremap H ^
nnoremap L $
vnoremap L g_

" Select entire buffer (like Ctrl-A)
nnoremap vy ggVG

" Select last inserted text
nnoremap gV `[v`]

" Use <TAB> to indent in visual mode
vnoremap <Tab> >'<0v'>$
vnoremap <S-Tab> <'<0v'>$

" Create newlines without entering insert mode
nnoremap go o<ESC>k
nnoremap gO O<ESC>j

" Update (save) active buffer
nnoremap gs :update<CR>

" Break a comma-delimited list onto new lines
vnoremap <LEADER>, :s/,/,\r/g<CR>

" Command line editing
map <C-K> :<Up>
cnoremap <C-H> <LEFT>
cnoremap <C-L> <RIGHT>
cnoremap <C-J> <DOWN>
cnoremap <C-K> <UP>

" Set the working directory of that of the current file
cnoremap cwd lcd %:p:h

" disable the ever-annoying Ex mode shortcut key. make Q repeat the last macro
" instead.
nnoremap Q @@

" remove doc lookup maping because it's easy to fat finger and never useful
nnoremap K k
vnoremap K k

" Tag navigation
nnoremap <M-]> <C-]>
nnoremap <M-[> <C-T>
nnoremap <M-\> :execute "ptag " . expand("<cword>")<CR>

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
" buffer navigation
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
" ,l        : switch to last-used buffer
"nnoremap <LEADER>l :e#<CR>
" close the current buffer and go to previous one
"nnoremap <LEADER>bq :bp <BAR> bd #<CR>

" Window commands --------------------------------------------------------
" split window horizontally or veritcally *and* switch to the new split
nnoremap <LEADER>hs :split<BAR>:wincmd j<CR>
nnoremap <LEADER>vs :vsplit<BAR>:wincmd l<CR>
" close the current window
nnoremap <LEADER>sc :close<CR>

" navigate splits with g command prepended to the analogous vim motion
nnoremap gh :wincmd h<CR>
nnoremap gj :wincmd j<CR>
nnoremap gk :wincmd k<CR>
nnoremap gl :wincmd l<CR>

" Abbreviations/Typo fixes -----------------------------------------------
iabbrev teh the
iabbrev tehn then
iabbrev retrun return
iabbrev pritn print
iabbrev #i #include
iabbrev #d #define
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" Mappings for plugins ---------------------------------------------------
if filereadable(expand("$HOME/.vimrc.bundles"))
  source $HOME/.vimrc.bundles
endif

" .vim.local file sourcing -----------------------------------------------
"let s:localvim = findfile(".vim.local", ".;")
"if s:localvim != ''
"  execute "source " . s:localvim
"endif

"vim:ft=vim ts=2 sw=2 tw=2
