#! /usr/bin/env bash

PACK=vim/pack/myplugins/start

op=pull
if [ $# -ne 0 ] && [ $1 == "-a" ]; then
  op=add
fi

# Execute these commands once to create a subtree of the desired plugin
git subtree $op --prefix $PACK/vim-airline https://github.com/vim-airline/vim-airline.git master --squash
git subtree $op --prefix $PACK/vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git master --squash

git subtree $op --prefix $PACK/surround https://github.com/tpope/vim-surround.git master --squash
git subtree $op --prefix $PACK/commentary https://github.com/tpope/vim-commentary.git master --squash
#git subtree $op --prefix $PACK/sensible https://github.com/tpope/vim-sensible.git master --squash

git subtree $op --prefix $PACK/a.vim https://github.com/vim-scripts/a.vim.git master --squash
git subtree $op --prefix $PACK/bufexplorer https://github.com/jlanzarotta/bufexplorer.git master --squash
git subtree $op --prefix $PACK/vim-better-whitespace https://github.com/ntpeters/vim-better-whitespace.git master --squash
git subtree $op --prefix $PACK/onedark.vim https://github.com/ukyouz/onedark.vim.git master --squash
git subtree $op --prefix $PACK/goyo.vim https://github.com/junegunn/goyo.vim.git master --squash
git subtree $op --prefix $PACK/vim-sneak https://github.com/justinmk/vim-sneak.git master --squash

