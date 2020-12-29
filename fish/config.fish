if status --is-interactive
    direnv hook fish | source
    pyenv init - | source
    register-python-argcomplete --shell fish pipx | .

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish
. ~/.config/fish/vars.fish
. ~/.config/fish/nvm.fish

fzf_key_bindings
