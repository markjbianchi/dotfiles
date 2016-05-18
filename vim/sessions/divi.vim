" ~/.dotfiles/vim/sessions/divi.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 17 May 2016 at 19:23:21.
" Open this file in Vim and run :source % to restore your session.

set guioptions=gmrL
silent! set guifont=Sauce\ Code\ Powerline:h11
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'monokai' | colorscheme monokai | endif
call setqflist([{'lnum': 8753, 'col': 129, 'valid': 1, 'vcol': 0, 'nr': 0, 'type': '', 'pattern': '', 'filename': '/Users/mbianchi/_Projects/divi/fw/tags', 'text': 'currencyAmt	common/include/offline_db_svc.h	/^    uint8       currencyAmt[3];     \/\/ in currency, uint24 (little endian)$/;"	m	struct:_DevDbRecord'}, {'lnum': 8830, 'col': 75, 'valid': 1, 'vcol': 0, 'nr': 0, 'type': '', 'pattern': '', 'filename': '/Users/mbianchi/_Projects/divi/fw/tags', 'text': 'deviceId	common/include/offline_db_svc.h	/^    MacAddr     deviceId;$/;"	m	struct:_DevDbRecord'}, {'lnum': 8877, 'col': 117, 'valid': 1, 'vcol': 0, 'nr': 0, 'type': '', 'pattern': '', 'filename': '/Users/mbianchi/_Projects/divi/fw/tags', 'text': 'durationSecs	common/include/offline_db_svc.h	/^    uint8       durationSecs[3];    \/\/ uint24 (little endian)$/;"	m	struct:_DevDbRecord'}, {'lnum': 11347, 'col': 75, 'valid': 1, 'vcol': 0, 'nr': 0, 'type': '', 'pattern': '', 'filename': '/Users/mbianchi/_Projects/divi/fw/tags', 'text': 'schemeId	common/include/offline_db_svc.h	/^    uint16      schemeId;$/;"	m	struct:_DevDbRecord'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/_Projects/divi/fw/common/source
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +53 ~/_Projects/divi/fw/common/include/offline_db_svc.h
badd +360 offline_db_svc.c
badd +824 payscheme_svc.c
badd +83 ~/_Projects/divi/fw/common/include/analytlog_svc.h
argglobal
silent! argdel *
argadd ~/_Projects/divi/fw/makefile
edit ~/_Projects/divi/fw/common/include/analytlog_svc.h
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 27 + 28) / 57)
exe 'vert 1resize ' . ((&columns * 93 + 93) / 187)
exe '2resize ' . ((&lines * 26 + 28) / 57)
exe 'vert 2resize ' . ((&columns * 93 + 93) / 187)
exe '3resize ' . ((&lines * 27 + 28) / 57)
exe 'vert 3resize ' . ((&columns * 93 + 93) / 187)
exe '4resize ' . ((&lines * 26 + 28) / 57)
exe 'vert 4resize ' . ((&columns * 93 + 93) / 187)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 82 - ((21 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
82
normal! 0
lcd ~/_Projects/divi/fw/common/include
wincmd w
argglobal
edit ~/_Projects/divi/fw/common/source/payscheme_svc.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 823 - ((11 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
823
normal! 0
lcd ~/_Projects/divi/fw/common/source
wincmd w
argglobal
edit ~/_Projects/divi/fw/common/include/offline_db_svc.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 53 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
53
normal! 032|
lcd ~/_Projects/divi/fw/common/include
wincmd w
argglobal
edit ~/_Projects/divi/fw/common/source/offline_db_svc.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 519 - ((10 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
519
normal! 05|
lcd ~/_Projects/divi/fw/common/source
wincmd w
exe '1resize ' . ((&lines * 27 + 28) / 57)
exe 'vert 1resize ' . ((&columns * 93 + 93) / 187)
exe '2resize ' . ((&lines * 26 + 28) / 57)
exe 'vert 2resize ' . ((&columns * 93 + 93) / 187)
exe '3resize ' . ((&lines * 27 + 28) / 57)
exe 'vert 3resize ' . ((&columns * 93 + 93) / 187)
exe '4resize ' . ((&lines * 26 + 28) / 57)
exe 'vert 4resize ' . ((&columns * 93 + 93) / 187)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
