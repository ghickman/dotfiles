function pythons
    set --local start $argv[1]

    # get released versions of python 3
    set --local all_versions (pyenv install -l | awk '{ gsub(/ /, ""); print }' | awk '/^3\.[0-9]{1,2}\.[0-9]{1,2}$/ { print $1 }')

    # find the latest minor version, eg 11 if 3.11 is the latest
    set --local latest (echo $all_versions[-1] | awk -F"." '{ print $2 }')

    # build a sequence from start to latest
    set --local wanted (string join "|" (seq $start $latest))

    # filter all versions down to the minor version sequence requested
    set --local versions (string split " " $all_versions | grep -E "^3\.($wanted)")

    # install each version from start to latest
    for v in $versions
        pyenv install --skip-existing $v
    end
end
