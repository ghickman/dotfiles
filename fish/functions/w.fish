function w
    cd (find $HOME/Projects/snowfox -maxdepth 1 -type "d" | fzf) || exit
end
