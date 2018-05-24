#!/bin/bash

for file in $HOME/.bash/*; do
  # shellcheck disable=SC1090
  [ -e "$file" ] && source "$file"
done

# shellcheck disable=SC1090
source ~/.files/direnv
