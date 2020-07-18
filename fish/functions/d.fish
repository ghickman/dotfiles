function d
    cd (find $HOME/Documents -type "d" | fzf) || exit
end
