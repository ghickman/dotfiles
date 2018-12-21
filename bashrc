#!/bin/bash

for file in "$HOME"/.bash/*; do
  # shellcheck disable=SC1090
  [ -e "$file" ] && source "$file"
done

# shellcheck disable=SC1090
source ~/.files/direnv

if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
  # shellcheck disable=SC1090
  source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi
