function t
    tmux -CC attach-session -t (tmux list-sessions -F "#{session_name}" | fzf) || exit
end
