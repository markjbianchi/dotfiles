# Source the global definitions
if [ -f /etc/zshrc ] ; then
   . /etc/zshrc
fi

# modify the PATH, removing duplicate paths
if [ -d "/opt/homebrew" ] ; then
  export HOMEBREW_ROOT="/opt/homebrew"
else
  export HOMEBREW_ROOT="/usr/local/Homebrew"
fi
PATH="$HOMEBREW_ROOT/bin:$PATH:/usr/local/sbin"
TMPPATH=$PATH
export PATH=`echo $TMPPATH | tr ":" "\n" | uniq | tr "\n" ":"`

# set up CDPATH to be able to jump to Project dirs more easily
export CDPATH=".:$HOME:$HOME/_Projects"

# Change python environment based on directory
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    # if not already activated and found a ./venv file in this directory
    # activate the virtual env
    if [[ -d ./venv ]] ; then
      source ./venv/bin/activate
    fi
  else
    # if already activated, check whether now current diretory belongs to the
    # previous virtual env folder: if yes do nothing, if no deactivate
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]] ; then
      deactivate
    fi
  fi
}

export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -L/usr/local/opt/sqlite/include"

# vi mode key bindings
bindkey -v
bindkey "^F" vi-cmd-mode
export VISUAL=vim

export TERM="xterm-color"
export LESS="--tabs=4 RMXg"
export EDITOR=vim
export PAGER=less

# Start the autocompletion system
autoload -Uz compinit && compinit
compdef g=git

#------------------------------------------------------------------------------
# Here is an assortment of command line prompts.  Choose one by
# deleting or commenting-out all others.
#------------------------------------------------------------------------------
#PS1='markb$ '
#PS1='[$PWD] '
#PS1='$(typeset -u PWD;echo $PWD)>' # force pathname to uppercase
PS1="%n[%1~]$ "
if [ $ITERM_SESSION_ID ]; then
  precmd() {
    echo -ne "\e]0;$PWD\a"
  }
fi
#DISABLE_AUTO_TITLE="true"

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
alias lh='ls -Alod -FG .*'
# setup 'ack'
alias ackc='ack --cc'
alias ackj='ack --java'
alias ackp='ack --python'
alias ackm='ack --make'
# mis-typing
alias mroe=more

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

