#!/bin/bash

for file in $HOME/.bash/*; do
  # shellcheck disable=SC1090
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# treat slashes as a delimiter with C-w
stty werase undef
bind '"\C-w": unix-filename-rubout'

# deal with aws cli completion bullshit
complete -C aws_completer aws

eval "$(pyenv init -)"

# shellcheck disable=SC1090
source "${HOME}/.files/direnv"

GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
  # shellcheck disable=SC1090
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
