# Load ~/.bash_prompt, ~/.vars, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in functions prompt vars aliases environments extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# base
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

# postgres
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

