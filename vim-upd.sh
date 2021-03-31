#! /usr/bin/env bash

# Execute these commands once to create a subtree of the desired plugin
git subtree add --prefix vim/pack/myplugins/start/vim-airline https://github.com/vim-airline/vim-airline.git master --squash
git subtree add --prefix vim/pack/myplugins/start/vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git master --squash

git subtree add --prefix vim/pack/myplugins/start/surround https://github.com/tpope/vim-surround.git master --squash
git subtree add --prefix vim/pack/myplugins/start/commentary https://github.com/tpope/vim-commentary.git master --squash
#git subtree add --prefix .vim/pack/myplugins/start/sensible https://github.com/tpope/vim-sensible.git master --squash

git subtree add --prefix vim/pack/myplugins/start/vim-better-whitespace https://github.com/ntpeters/vim-better-whitespace.git master --squash
git subtree add --prefix vim/pack/myplugins/start/onedark https://github.com/joshdick/onedark.git master --squash
git subtree add --prefix vim/pack/myplugins/start/a.vim https://github.com/vim-scripts/a.vim.git master --squash
git subtree add --prefix vim/pack/myplugins/start/goyo.vim https://github.com/junegunn/goyo.vim.git master --squash
git subtree add --prefix vim/pack/myplugins/start/vim-sneak https://github.com/justinmk/vim-sneak.git master --squash
git subtree add --prefix vim/pack/myplugins/start/bufexplorer https://github.com/jlanzarotta/bufexplorer.git master --squash



# These commands will update (pull) from the subtree repos
