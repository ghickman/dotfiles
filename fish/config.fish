. ~/.config/fish/vars.fish

if status --is-interactive
    direnv hook fish | source
    fnm env | source

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish
. ~/.config/fish/abbreviations.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
