#!/bin/bash

# shellcheck disable=SC1090
source ~/.bashrc

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# treat slashes as a delimiter with C-w
stty werase undef
bind '"\C-w": unix-filename-rubout'

# deal with aws cli completion bullshit
complete -C aws_completer aws

eval "$(pyenv init -)"

GPG_TTY=$(tty)
export GPG_TTY

iterm_integration="~/.iterm2_shell_integration.bash"
if [ -f "$iterm_integration" ]; then
   # shellcheck disable=SC1090
   source "$iterm_integration"
fi

lunchy_script=$(gem which lunchy)
lunchy_completion="$(dirname "$lunchy_script")/../extras/lunchy-completion.bash"
 if [ -f "$lunchy_completion" ]; then
   # shellcheck disable=SC1090
   . "$lunchy_completion"
 fi
