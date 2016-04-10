#!/bin/sh

set -e

agent_info="$HOME/.gnupg/.gpg-agent-info"

if test -f "$agent_info" && -n "$(pgrep gpg-agent)"; then
    . "$agent_info"
    export GPG_AGENT_INFO
else
    eval "$(/usr/local/bin/gpg-agent --daemon --write-env-file "$agent_info")"
fi
# export GPG_TTY=$(tty)
