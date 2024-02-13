# base
set PATH $HOME/.bin $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin /usr/local/sbin $PATH

# git toolbelt
set PATH $HOME/.files/git-toolbelt $PATH

# Postgres.app
set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# Vim as Default Editor
set --export EDITOR /opt/homebrew/bin/nvim

# No pycs
set --export PYTHONDONTWRITEBYTECODE 1

# brew
set --export HOMEBREW_NO_AUTO_UPDATE 1

# FZF
set --export FZF_DEFAULT_COMMAND "fd --exclude=.git --hidden --type f"

# No really, no fucking cows
set --export ANSIBLE_NOCOWS 1

# GPG
set --export GPG_TTY (tty)

# Use vim to view man pages
set --export MANPAGER "nvim +Man!"

# Configure the pyenv directory
set --export PYENV_ROOT $HOME/.pyenv

# Tell pipx which Python to use
set --export PIPX_DEFAULT_PYTHON (which python3)
