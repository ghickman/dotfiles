# Path
PATH="$PATH\:/usr/local/bin:/usr/local/sbin"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Vim as Default Editor
EDITOR=`which vim`

# Colours
CLICOLOR=1
LS_COLORS='di=01;34'
DJANGO_COLORS="light"

# force the use of correct arch flags
ARCHFLAGS="-arch x86_64"

# Don’t clear the screen after quitting a manual page
MANPAGER="less -X"

# Global Bash History
PROMPT_COMMAND="history -a"

# Larger bash history (allow 32³ entries; default is 500)
HISTSIZE=32768
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignoredups

SOLR_CONF=`brew --prefix`/Cellar/solr/3.5.0/libexec/example/solr/
SOLR_SCHEMA=`brew --prefix`/Cellar/solr/3.5.0/libexec/example/solr/conf/schema.xml

