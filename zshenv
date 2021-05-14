# modify the PATH, remove duplicate paths
if [ -d "/opt/homebrew/bin" ]; then
  PATH="/opt/homebrew/bin:/usr/local/sbin:${PATH}"
fi
#TMPPATH="${PATH}"
#export PATH=`echo $TMPPATH | tr ":" "\n" | uniq | tr "\n" ":"`

export JAVA_HOME=$(/usr/libexec/java_home)

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"

export EDITOR=vim
export PAGER=less
