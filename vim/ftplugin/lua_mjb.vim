" for editing lua files
if exists("b:mjb_ftplugin")
  finish
endif
let b:mjb_ftplugin = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal formatoptions=crql
setlocal cindent
setlocal comments=b:--,O:--

" comments
map <buffer> <silent> \c mz^i--<ESC>`z
map <buffer> <silent> \C mz^2x`z
vmap <buffer> <silent> \c <ESC>:'<,'>s/^/--/<CR>'<
vmap <buffer> <silent> \C <ESC>:'<,'>s/^--//<CR>'<
