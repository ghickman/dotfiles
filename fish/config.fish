. ~/.config/fish/vars.fish

if status --is-interactive
    direnv hook fish | source
    fnm env | source

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish
. ~/.config/fish/abbreviations.fish
