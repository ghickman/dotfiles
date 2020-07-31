if status --is-interactive
    eval (direnv hook fish)
    pyenv init - | source
    register-python-argcomplete --shell fish pipx | .

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish
. ~/.config/fish/vars.fish


fzf_key_bindings
