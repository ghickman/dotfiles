function n
    cd (find $HOME/Notes -maxdepth 1 -type "d" | fzf) || exit
end
