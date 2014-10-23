#!/bin/sh

DOWNLOAD="https://bitbucket.org/mutt/mutt/downloads/mutt-1.5.23.tar.gz"
PATCH="http://lunar-linux.org/~tchan/mutt/patch-1.5.23.sidebar.20140412.txt"

wget -q -O - $DOWNLOAD | tar xvfz -
cd ./mutt-1.5.23
wget -q -O - $PATCH | patch -p1

# homebrew options minus tokyo cabinet because it errors out
# TODO: should this be prefix of ~/.bin/ ?
./configure \
--disable-dependency-tracking \
--disable-warnings \
--prefix=/usr/local \
--with-ssl=/usr/local/opt/openssl \
--with-sasl \
--with-gss \
--enable-imap \
--enable-smtp \
--enable-pop \
--enable-hcache \
--with-homespool=.mbox

files=`ag -l --nocolor aclocal-1.13 --ignore build.sh`
for f in $files; do
    sed -i '' 's/aclocal-1.13/aclocal/' $f
    sed -i '' 's/automake-1.13/automake/' $f
done

automake --add-missing

make
