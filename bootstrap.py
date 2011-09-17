from os import listdir, symlink
from os.path import abspath, expanduser

for fn in listdir('.'):
    if fn == '.git':
        continue
    symlink(abspath(fn), expanduser('~'))

