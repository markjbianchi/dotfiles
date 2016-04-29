" $Id: c_jah.vim 13 2007-11-21 06:02:34Z jheddings $

if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent

setlocal nocindent
setlocal formatoptions=croql
setlocal comments=b:#

" comments
map <buffer> <silent> \c mz0i#<ESC>`z
map <buffer> <silent> \C mz0z`z
vmap <buffer> <silent> \c <ESC>:'<,'>s/^/#/<CR>
vmap <buffer> <silent> \C <ESC>:'<,'>s/^#//<CR>

" tab completion mapping
"if g:jah_SmartTabCompletion
"  inoremap <buffer> <Tab>   <C-R>=KeywordTabWrapper("\\\<C-N\>")<CR>
"  inoremap <buffer> <S-Tab> <C-R>=KeywordTabWrapper("\\\<C-P\>")<CR>
"endif

" define some c syntax stuff
syn match Brackets /[{}[\]()]/
syn match Function /[a-zA-Z][a-zA-Z0-9_] *(/
syn match Relation /==|!=|<=|>=/
