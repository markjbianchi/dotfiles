#! /usr/bin/env bash

PLUGINS=vim/pack/plugins/start
COLORS=vim/pack/colors/start
SYNTAX=vim/pack/syntax/start

op=pull
if [ $# -ne 0 ] && [ $1 == "-a" ]; then
  op=add
fi

# Execute these commands once to create a subtree of the desired plugin
git subtree $op --prefix $PLUGINS/vim-airline https://github.com/vim-airline/vim-airline.git master --squash
git subtree $op --prefix $COLORS/vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git master --squash
git subtree $op --prefix $COLORS/onedark.vim https://github.com/ukyouz/onedark.vim.git master --squash

git subtree $op --prefix $PLUGINS/surround https://github.com/tpope/vim-surround.git master --squash
git subtree $op --prefix $PLUGINS/commentary https://github.com/tpope/vim-commentary.git master --squash
#git subtree $op --prefix $PLUGINS/sensible https://github.com/tpope/vim-sensible.git master --squash

git subtree $op --prefix $PLUGINS/a.vim https://github.com/vim-scripts/a.vim.git master --squash
git subtree $op --prefix $PLUGINS/bufexplorer https://github.com/jlanzarotta/bufexplorer.git master --squash
git subtree $op --prefix $PLUGINS/vim-better-whitespace https://github.com/ntpeters/vim-better-whitespace.git master --squash
git subtree $op --prefix $PLUGINS/goyo.vim https://github.com/junegunn/goyo.vim.git master --squash
git subtree $op --prefix $PLUGINS/vim-sneak https://github.com/justinmk/vim-sneak.git master --squash

