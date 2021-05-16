# modify the PATH, remove duplicate paths
if [ -d "/opt/homebrew" ]; then
  export HOMEBREW_ROOT="/opt/homebrew"
else
  export HOMEBREW_ROOT="/usr/local/Homebrew"
fi
#TMPPATH="${PATH}"
#export PATH=`echo $TMPPATH | tr ":" "\n" | uniq | tr "\n" ":"`
PATH="$HOMEBREW_ROOT/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"

export EDITOR=vim
export PAGER=less
