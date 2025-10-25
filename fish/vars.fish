# base
set PATH $HOME/.bin $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin /usr/local/sbin $PATH

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

# Always use uv managed python so we don't pick up a homebrew one by accident
set --export UV_PYTHON_PREFERENCE only-managed

# Yes, thank you Django, I am quite aware ಠ_ಠ
set --export DJANGO_RUNSERVER_HIDE_WARNING "true"
