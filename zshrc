# On MacOS, here is order of file inclusion for zsh:
#   /etc/zshenv     (doesn't exist)
#   ~/.zshenv
#   /etc/zprofile
#   ~/.zprofile
#   /etc/zshrc
#   ~/.zshrc
#   /etc/zlogin     (doesn't exist)
#   ~/.zlogin

if [ -d "/opt/homebrew" ] ; then
  export HOMEBREW_ROOT="/opt/homebrew"
else
  export HOMEBREW_ROOT="/usr/local/Homebrew"
fi
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${HOMEBREW_ROOT}/bin:${PATH}"
PATH="${PATH}:/usr/local/opt/postgresql@11/bin"
export PATH

# set up CDPATH to be able to jump to Project dirs more easily
export CDPATH=".:${HOME}:${HOME}/_Projects"

# For divi sabik development
export DJANGO_SETTINGS_MODULE="sabik.development"
# To enable analog measurements in Logic2 (requires executing from command line: ~/Applications/Logic2.app/Contents/MacOS/Logic)
export ENABLE_MEASUREMENTS_V2="1"

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
bindkey "^J" vi-cmd-mode                  # switch to command mode with Ctrl-J
bindkey -M vicmd "^V" edit-command-line   # use Ctrl-V to edit command in vi
export KEYTIMEOUT=1                       # make vi mode transitions faster (in 1/100th secs)
# incremental search in insert mode
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
# beginning search in insert mode
bindkey "^P" history-search-forward
bindkey "^N" history-search-backward
# incremental search in command mode
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M vicmd "?" history-incremental-search-backward
# navigate search in vi command mode
bindkey -M viins "^F" history-incremental-search-forward
bindkey -M viins "^R" history-incremental-search-backward


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
alias h=history
alias hg='history | grep'
alias RM='/bin/rm -f'
alias rm='/bin/rm -i'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias ln='ln -v'
alias S='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias defines="gcc -E -DM -xc /dev/null"
alias includes="gcc -E -Wp,-v -xc /dev/null"
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


