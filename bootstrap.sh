sudo /usr/bin/xcodebuild -license

echo "========== install XCode CLI Tools"
xcode-select --install

echo "========== install homebrew"
if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "========== brew the world"
brew tap Homebrew/bundle
brew bundle

echo "========== link files"
while read -r name; do
    source="$PWD/$name"
    target="$HOME/.$name"

    if [ -h "$target" ]; then
        rm "$target"
    elif [ -d "$target" ]; then
        rm -rf "$target"
    fi

    ln -s "$source" "$target"
    echo "Linked $source to $target"

done < "$PWD/link-files"
chmod 400 "$HOME/.msmtprc"

mkdir -p "$HOME/.config"
ln -s "$PWD/flake8" "$HOME/.config/flake8"
ln -s "$PWD/vim" "$HOME/.config/nvim"
ln -s "$PWD/vimrc" "$HOME/.config/init.vim"
ln -s "$PWD/mutt/mime.types" "$HOME/.mime.types"

echo "========== set up yaml lint"
yamllint_dir="$HOME/.config/yamllint"
mkdir -p "$yamllint_dir"
ln -s "$PWD/yamllint" "$yamllint_dir/config"

bucket="https://s3-eu-west-1.amazonaws.com/ghickman-misc/install"

echo "========== install monaco powerline font"
font="Monaco-Powerline.otf"
fonts_location="$HOME/Library/Fonts/"
if [ ! -d "$fonts_location$font" ]; then
    curl -O --silent "$bucket/Monaco-for-Powerline.otf"
    mv "$font" "$fonts_location"
fi

# Install pretty iTerm colors
iterm_colourscheme="wombat-evolved.itermcolors"
curl -O --silent "$bucket/$iterm_colourscheme"
open "$iterm_colourscheme"
rm "$iterm_colourscheme"

echo "========== install pythongs"
./pythons.sh

echo "========== install pip requirements"
mkdir -p ~/.pip/{cache,wheels}
pip install --upgrade -r requirements.txt

echo "========== install python bins with pipsi"
./pipsi-reinstall

echo "========== configure preferences"
./osx

echo "========== create maildir"
mkdir -p ~/.mail/george-ghickman.co.uk

echo "========== set bash 4 as shell"
bash4="/usr/local/bin/bash"
if ! grep -qe $bash4 "/etc/shells"; then
    echo $bash4 | sudo tee -a "/etc/shells"
    chsh -s $bash4
fi

echo "========== Setting up TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Run <prefix>+I in tmux now"
