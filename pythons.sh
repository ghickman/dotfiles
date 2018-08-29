#!/bin/sh

pyenv install 2.7.15
pyenv install 3.5.6
pyenv install 3.6.6
pyenv install 3.7.0
pyenv install pypy-5.7.1
pyenv install pypy3.5-6.0.0

pyenv global 3.7.0 3.6.6 3.5.6 2.7.15 pypy-5.7.1 pypy3.5-6.0.0
