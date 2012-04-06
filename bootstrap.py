from os import listdir, symlink, system
from os.path import abspath, basename, expanduser, join

for fn in listdir('.'):
    if fn.startswith('.') or fn is basename(__file__):
        continue
    try:
        symlink(abspath(fn), join(expanduser('~/'), '.%s' % fn))
    except OSError:
        print '%s already exists, skipping.' % fn
        pass

    if fn == 'osx':
        system('/bin/sh ~/.osx')

