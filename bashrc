#!/bin/bash

for file in "$HOME"/.bash/*; do
  # shellcheck disable=SC1090
  [ -e "$file" ] && source "$file"
done

eval "$(direnv hook bash)"
