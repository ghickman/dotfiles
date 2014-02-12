echo "========== install homebrew"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

echo "========== brew the world"
./homebrew

echo "========== cask all the things"
./casks

echo "========== link files"
while read name; do
    source="$PWD/$name"
    target="$HOME/.$name"

    if [ -h $target ]; then
        rm $target
    elif [ -d $target ]; then
        rm -rf $target
    fi

    ln -s "$source" "$target"
    echo "Linked $source to $target"

done < "$PWD/link-files"

echo "========== configure preferences"
./osx
