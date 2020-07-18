# base
# set PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

set PATH $HOME/.bin $HOME/.local/bin $PATH

# git toolbelt
set PATH $HOME/.files/git-toolbelt $PATH

# Postgres.app
set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# Vim as Default Editor
set --export EDITOR /usr/local/bin/nvim

# No pycs
set --export PYTHONDONTWRITEBYTECODE 1

# Force pip it only install packages inside a venv
set --export PIP_REQUIRE_VIRTUALENV 1

# brew
set --export HOMEBREW_NO_AUTO_UPDATE 1

# FZF
set --export FZF_DEFAULT_COMMAND "ag --hidden --ignore-dir='.git' --filename-pattern \"\""

# No really, no fucking cows
set --export ANSIBLE_NOCOWS 1

# GPG
set --export GPG_TTY (tty)
