. ~/.config/fish/vars.fish

if status --is-interactive
    direnv hook fish | source
    pyenv init - | source
    register-python-argcomplete --shell fish pipx | .

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish

fzf_key_bindings
