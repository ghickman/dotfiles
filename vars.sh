# Path
# base
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

# postgres
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Vim as Default Editor
export EDITOR=`which vim`

# Colours
export CLICOLOR=1
export LS_COLORS='di=01;34'
export DJANGO_COLORS="light"

# force the use of correct arch flags
export ARCHFLAGS="-arch x86_64"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Global Bash History
export PROMPT_COMMAND="history -a"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

export SOLR_CONF=`brew --prefix`/Cellar/solr/3.5.0/libexec/example/solr/
export SOLR_SCHEMA=`brew --prefix`/Cellar/solr/3.5.0/libexec/example/solr/conf/schema.xml

