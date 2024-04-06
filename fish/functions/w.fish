function w
    cd (find $HOME/Projects -maxdepth 1 -type "d" | fzf) || exit
    cd (find . -maxdepth 1 -type "d" | fzf) || exit
end
