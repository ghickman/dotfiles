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

echo "========== install root cert bundle"
certs_home="/System/Library/OpenSSL/certs/"
if [ ! -d "$certs_home/cacert.org" ]; then
    curl -O https://s3-eu-west-1.amazonaws.com/ghickman-misc/install/certs.tar.gz
    tar xzf certs.tar.gz
    sudo mv certs/* $certs_home
fi

echo "========== install monaco powerline font"
font="Monaco-Powerline.otf"
fonts_location="~/Library/Fonts"
if [ ! -d "$fonts_location/$font" ]; then
    curl -O https://s3-eu-west-1.amazonaws.com/ghickman-misc/install/Monaco-Powerline.otf
    mv $font $fonts_location
fi
