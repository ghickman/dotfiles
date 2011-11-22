from os import listdir, symlink
from os.path import abspath, basename, expanduser, join

for fn in listdir('.'):
    if not fn.startswith('.') and fn != basename(__file__):
        continue
    try:
        symlink(abspath(fn), join(expanduser('~/'), fn))
    except OSError:
        print '%s already exists, skipping.' % fn
        pass

