#!/bin/bash

# Load ~/.bash_prompt, ~/.vars, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in functions prompt vars aliases environments extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# treat slashes as a delimiter with C-w
stty werase undef
bind '"\C-w": unix-filename-rubout'

eval "$(direnv hook bash)"
