autocmd! BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd! BufRead,BufNewFile *.py set nocindent
autocmd! BufWritePre        *.py normal m`:%s/\s\+$//e ``
filetype plugin indent on

