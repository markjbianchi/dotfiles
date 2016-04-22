# Mark Bianchi Dot Files

This is my attempt at organizing and managing my dotfiles. Heavily leveraged
from others on github. I have used some of the methods from [Jake Zimmerman](https://github.com/jez/dotfiles),
who advocates the use of the [rcm] package. There is also some excellent resources
online at <https://dotfiles.github.io>.

I am mostly running on Mac OS X, sometimes linux and cygwin. On OS X, I am using
Homebrew + iTerm2 most of the time. I also have been integrating most of Jake's
[vim-as-ide][ide] for vim configuration.

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


[rcm]: https://github.com/thoughtbot/rcm
[jez_dot]: https://github.com/jez/dotfiles
[ide]: https://github.com/jez/vim-as-ide
