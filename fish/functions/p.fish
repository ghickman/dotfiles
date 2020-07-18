function p
    cd (find $HOME/Projects -maxdepth 1 -type "d" | fzf) || exit
end
