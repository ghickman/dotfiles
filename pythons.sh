#!/bin/sh

pyenv install 2.7.16
pyenv install 3.5.7
pyenv install 3.6.8
pyenv install 3.7.3
pyenv install pypy-5.7.1
pyenv install pypy3.6-7.1.0

pyenv global 3.7.3 3.6.8 3.5.7 2.7.16 pypy-5.7.1 pypy3.6-7.1.0
