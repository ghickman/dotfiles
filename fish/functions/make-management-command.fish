function make-management-command
    set --local path $argv[1]

    mkdir -p "$path/managment/commands"
    touch "$path/managment/__init__.py"
    touch "$path/managment/commands/__init__.py"
end
