# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in prompt exports aliases functions environments extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

