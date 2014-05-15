sudo /usr/bin/xcodebuild -license

echo "========== install homebrew"
if ! hash brew 2>/dev/null; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "========== brew the world"
./homebrew

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

echo "========== cask all the things"
./casks

echo "========== install limechat theme"
themes="~/Library/Application Support/LimeChat/Themes/"
mkdir $themes
ln -s limechat/solarized-dark.* $themes

bucket="https://s3-eu-west-1.amazonaws.com/ghickman-misc/install"
echo "========== install root cert bundle"
certs_home="/System/Library/OpenSSL/certs/"
if [ ! -d "$certs_home/cacert.org" ]; then
    curl -O --silent "$bucket/certs.tar.gz"
    tar xzf certs.tar.gz
    sudo mv certs/* $certs_home
    rm certs.tar.gz
fi

echo "========== install monaco powerline font"
font="Monaco-Powerline.otf"
fonts_location="~/Library/Fonts/"
if [ ! -d "$fonts_location$font" ]; then
    curl -O --silent "$bucket/Monaco-Powerline.otf"
    mv $font $fonts_location
fi

# Install pretty iTerm colors
curl -O --silent "$bucket/solarized-dark.itermcolors"
open "solarized-dark.itermcolors"
rm "solarized-dark.itermcolors"

echo "========== init vim submodules"
cd ~/.files
git submodule update --init

echo "========== install pip requirements"
mkdir ~/.pip/{cache,wheels}
pip install --upgrade -r requirements.txt

echo "========== textmate"
curl -O --silent "http://archive.textmate.org/TextMate_1.5.11_r1635.zip"
unzip TextMate_1.5.11_r1635.zip
mv TextMate.app /Applications/
rm TextMate_1.5.11_r1635.zip
curl -O --silent "https://raw.githubusercontent.com/altercation/solarized/master/textmate-colors-solarized/Solarized%20(dark).tmTheme"
open "$HOME/.files/Solarized%20(dark).tmTheme"

echo "========== configure preferences"
./osx

echo "========== create maildir"
mkdir -p ~/.mail/george-ghickman.co.uk
