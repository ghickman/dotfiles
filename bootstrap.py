from os import listdir, symlink, system
from os.path import abspath, basename, expanduser, join


EXEMPT = (
    '.git',
    '.gitmodules',
    'bootstrap.py',
    'osx',
    'README.md',
)

for fn in listdir('.'):
    if fn in EXEMPT:
        continue
    try:
        symlink(abspath(fn), join(expanduser('~/'), '.{0}'.format(fn)))
    except OSError:
        print('{0} already exists, skipping.'.format(fn))

system('/bin/sh osx')
