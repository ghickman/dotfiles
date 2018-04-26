#!/bin/bash

# shellcheck disable=SC1090
source "${HOME}/.bashrc"

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

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

lunchy_script=$(gem which lunchy)
lunchy_dir=$(dirname "$lunchy_script")/../extras
 if [ -f "$lunchy_dir/lunchy-completion.bash" ]; then
   . "$lunchy_dir/lunchy-completion.bash"
 fi
