#!/usr/local/bin/bash

set -e
shopt -s globstar

FORMAT="%Y-%m-%d_%H-%M-%S"

# Video files
exiftool -v -r -ext MOV -ext MP4 -ext AVI -ext 3GP -FileName\<CreateDate -d $FORMAT.%%e .

# Images
jhead -autorot -ft -dt -n$FORMAT **/*
