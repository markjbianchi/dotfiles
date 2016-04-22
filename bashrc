# modify the PATH, remove duplicate paths
PATH="$HOME/bin:/usr/local/bin:${PATH}"
TMPPATH="${PATH}"
#export PATH=`echo $TMPPATH | tr ":" "\n" | uniq | tr "\n" ":" | head -c -1`

alias path='echo $PATH | tr ":" "\n"'

# set up CDPATH to be able to jump to Project dirs more easily
export CDPATH=".:$HOME:$HOME/_Projects/divi:$HOME/_Projects/VIS/svn"

#export JAVA_HOME='/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home'

# This ignores file tab completion of hidden dirs/files (great for .svn|.git dirs)
bind 'set match-hidden-files off'
bind 'set completion-ignore-case on'    # case-insensitive completion

# set vi command line
set -o vi
export VISUAL=vim
export EDITOR=vim

export LESS="--tabs=4 RMXg"

#export TERM="xterm-256color"

#------------------------------------------------------------------------------
# Here is an assortment of command line prompts.  Choose one by
# deleting or commenting-out all others.
#------------------------------------------------------------------------------
#PS1='markb$ '
#PS1='[$PWD] '
#PS1='$PWD>'
#PS1='$(typeset -u PWD;echo $PWD)>' # force pathname to uppercase
#PS1='\u[\W]\$ '
PS1='\[\e]2;\w\a\]\u[\W]\$ '
PROMPT_COMMAND='echo -ne "\033]0;${PWD}"; echo -ne "\007"'

#------------------------------------------------------------------------------
# setup various command aliases
#------------------------------------------------------------------------------
alias less='less -R'
alias more=less
alias mroe=less
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
alias tree='/usr/local/bin/tree -nF'
alias g='gvim'
alias e='vim'
# setup 'ls'
alias l='/bin/ls -hF --color=never'
alias lsf='ls -b -FC -G'
alias lsr='ls -R -G'
alias ll='ls -Alo -G'
alias la=hidden

# Include bash functions
[[ -f $HOME/.bash.functions ]] && source $HOME/.bash.functions

