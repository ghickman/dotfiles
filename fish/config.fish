. ~/.config/fish/vars.fish

if status --is-interactive
    direnv hook fish | source
    pyenv init --path | source
    register-python-argcomplete --shell fish pipx | .
    fnm env | source

    starship init fish | source
end

set fish_greeting

. ~/.config/fish/aliases.fish

#
# global NPM install
# need to do this after fnm is set up earlier
set PATH $HOME/.fnm/node-versions/(fnm current)/installation/bin $PATH
