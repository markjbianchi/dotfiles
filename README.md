# Mark Bianchi Dot Files

This is my attempt at organizing and managing my dotfiles. Heavily leveraged
from others on github. I have used some of the methods from [Jake Zimmerman](https://github.com/jez/dotfiles),
who advocates the use of the [rcm] package. There is also some excellent resources
online at <https://dotfiles.github.io>.

I am mostly running on Mac OS X, sometimes linux and cygwin. On OS X, I am using
Homebrew + iTerm2 most of the time.

Clone this repo into home directory into .dotfiles/ then install RCM and run rcup.

## RCM installation

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcc rcup

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See
example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

## Vim configuration

I have mostly followed Jake's [vim-as-an-ide][ide] for vim configuration, with
some deviations of plugins based on some quick research of alternative packages.
I have also used [Vim as IDE][as-ide] for some addition input.

I am using [vim-plug](https://github.com/junegunn/vim-plug) as the plugin manager -
install that first, then you can add lines like `Plug 'tpope/vim-sensible'` to
`.vimrc.bundles` and run `:PlugInstall` to to download the plugin. Install it:
```
mkdir -p ~/.vim/autoload
curl -fLo ~/vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master
```

[rcm]: https://github.com/thoughtbot/rcm
[jez_dot]: https://github.com/jez/dotfiles
[ide]: https://github.com/jez/vim-as-ide
[as-ide]: http://yannesposito.com/Scratch/en/blog/Vim-as-IDE
