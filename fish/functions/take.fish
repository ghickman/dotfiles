function take --description "take <dir> - make and cd into a directory"
    mkdir -p $argv[1]
    cd $argv[1] || exit
end
