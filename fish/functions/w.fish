function w
    cd (find $HOME/Projects/datalab -maxdepth 1 -type "d" | fzf) || exit
end
