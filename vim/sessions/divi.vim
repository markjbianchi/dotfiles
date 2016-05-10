" ~/.dotfiles/vim/sessions/divi.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 10 May 2016 at 06:54:06.
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
call setqflist([{'lnum': 819, 'col': 13, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'payscheme_svc.c', 'text': ' * @fn      PayScheme_GetSchemeByModelName'}, {'lnum': 828, 'col': 6, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'payscheme_svc.c', 'text': 'bool PayScheme_GetSchemeByModelName(const char* model, PayScheme* scheme) {'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/_Projects/divi/fw
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +26 common/include/offline_db_svc.h
badd +27 common/source/offline_db_svc.c
badd +27 common/source/payscheme_svc.c
badd +1 common/source/txnlog_svc.c
argglobal
silent! argdel *
argadd makefile
edit common/source/txnlog_svc.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 145) / 291)
exe '2resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 2resize ' . ((&columns * 109 + 145) / 291)
exe '3resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 3resize ' . ((&columns * 109 + 145) / 291)
exe '4resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 4resize ' . ((&columns * 108 + 145) / 291)
exe '5resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 5resize ' . ((&columns * 108 + 145) / 291)
exe 'vert 6resize ' . ((&columns * 40 + 145) / 291)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/_Projects/divi/fw
wincmd w
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
let s:l = 75 - ((45 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
75
normal! 0
lcd ~/_Projects/divi/fw/common/source
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
let s:l = 96 - ((45 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
96
normal! 013|
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
let s:l = 73 - ((36 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
73
normal! 0
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
let s:l = 124 - ((36 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
124
normal! 05|
lcd ~/_Projects/divi/fw/common/source
wincmd w
argglobal
enew
file ~/_Projects/divi/fw/divifob/source/__Tagbar__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/_Projects/divi/fw/divifob/source
wincmd w
5wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 145) / 291)
exe '2resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 2resize ' . ((&columns * 109 + 145) / 291)
exe '3resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 3resize ' . ((&columns * 109 + 145) / 291)
exe '4resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 4resize ' . ((&columns * 108 + 145) / 291)
exe '5resize ' . ((&lines * 47 + 49) / 98)
exe 'vert 5resize ' . ((&columns * 108 + 145) / 291)
exe 'vert 6resize ' . ((&columns * 40 + 145) / 291)
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
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/_Projects/divi/fw
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 95|vert 1resize 31|2resize 47|vert 2resize 109|3resize 47|vert 3resize 109|4resize 47|vert 4resize 108|5resize 47|vert 5resize 108|6resize 95|vert 6resize 40|
5wincmd w
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
