function o
    open (find $HOME/Documents -type "d" | fzf) || exit
end
