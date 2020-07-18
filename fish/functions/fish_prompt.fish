function fish_prompt
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showstashstate true

    set_color purple
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    set_color yellow
    echo -n (fish_git_prompt)
    set_color normal

    # Line 2
    echo
    printf '↪ '
    set_color normal
end
