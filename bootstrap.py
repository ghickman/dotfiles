from os import listdir, symlink
from os.path import abspath, expanduser, join

for fn in listdir('.'):
    if fn == '.git' or not fn.startswith('.'):
        continue
    try:
        symlink(abspath(fn), join(expanduser('~/'), fn))
    except OSError:
        print '%s already exists, skipping.' % fn
        pass

