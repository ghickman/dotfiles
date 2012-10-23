from os import listdir, symlink, system
from os.path import abspath, basename, expanduser, join


EXEMPT = (
    'bin',
    'osx'
)

for fn in listdir('.'):
    if fn.startswith('.') or fn is basename(__file__) or fn in EXEMPT:
        continue
    try:
        symlink(abspath(fn), join(expanduser('~/'), '.{0}'.format(fn)))
    except OSError:
        print('{0} already exists, skipping.'.format(fn))

try:
    symlink('bin/ghi', '/usr/local/bin/ghi')
except OSError:
    print('ghi already linked')

system('/bin/sh ~/.osx')

