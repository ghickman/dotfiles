#!/bin/sh

set -eu

rsync \
    --archive \
    --compress \
    --delete \
    --exclude=.DS_Store \
    --exclude=AncientSpace \
    --exclude=creeperworld3 \
    --exclude=Rockstar\ Games \
    --exclude=Logs \
    --exclude=Zoom \
    --recursive \
    --verbose \
    /Users/george/Documents/ \
    george@ammanas.local:/volume1/Documents/
