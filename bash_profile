#!/bin/bash

configs="$HOME/.bash"
for file in `ls -1 $configs`; do
  file="$configs/$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# treat slashes as a delimiter with C-w
stty werase undef
bind '"\C-w": unix-filename-rubout'

# deal with aws cli completion bullshit
complete -C aws_completer aws

eval "$(direnv hook bash)"
