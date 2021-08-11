# Source the global definitions
if [ -f /etc/zshrc ] ; then
   . /etc/zshrc
fi

# vi mode key bindings
bindkey -v
bindkey "^F" vi-cmd-mode
export VISUAL=vim

# set up CDPATH to be able to jump to Project dirs more easily
export CDPATH=".:$HOME:$HOME/_Projects"

# Change python environment based on directory
if command -v pyenv 1>/dev/null 2>&1 ; then
  eval "$(pyenv init -)"
fi

export TERM="xterm-color"
export LESS="--tabs=4 RMXg"

# Start the autocompletion system
autoload -Uz compinit && compinit
compdef g=git

#------------------------------------------------------------------------------
# Here is an assortment of command line prompts.  Choose one by
# deleting or commenting-out all others.
#------------------------------------------------------------------------------
PS1='markb$ '
#PS1='[$PWD] '
#PS1='$(typeset -u PWD;echo $PWD)>' # force pathname to uppercase
PS1="%n[%1~]$ "
DISABLE_AUTO_TITLE="true"

#------------------------------------------------------------------------------
# setup various command aliases
#------------------------------------------------------------------------------
alias path='echo $PATH | tr ":" "\n"'
alias less='less -R'
alias more=less
alias RM='/bin/rm -f'
alias rm='/bin/rm -i'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias ln='ln -v'
alias S='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias defines="gcc -DM -E - </dev/null"
alias bk='echo && echo && echo =============================================================================='
alias cb='clear && echo "==============================================================================" && echo "=============================================================================="'
alias tree='tree -nF'
alias vi='vim'
alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
# setup 'ls'
alias l='/bin/ls -hF --color=never'
alias lsf='ls -b -FC -G'
alias lsr='ls -R -G'
alias ll='ls -Alo -G'
alias la=hidden
# setup 'ack'
alias ackc='ack --cc'
alias ackj='ack --java'
alias ackp='ack --python'
alias ackm='ack --make'

# Include custom functions
[[ -f $HOME/.custom-alias ]] && source $HOME/.custom-alias

#------------------------------------------------------------------------------
# setup options
#------------------------------------------------------------------------------
# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# enable extended globbing
setopt extendedglob

# allow [ or ] wherever you want
unsetopt nomatch


#vim:ft=zsh ts=2 sw=2 tw=2
