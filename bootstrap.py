from os import listdir, symlink, system
from os.path import abspath, basename, expanduser, isdir, join


def link(files, dest):
    for fn in files:
        if not (fn.startswith('.') or fn is basename(__file__) or isdir(fn)):
            continue
        try:
            symlink(abspath(fn), join(expanduser(dest), '.{0}'.format(fn)))
        except OSError:
            print('{0} already exists, skipping.'.format(fn))

link([fn for fn in listdir('.') if fn != 'osx' or not isdir(fn)], '~/')
link([fn for fn in listdir('./virtualenv')], '~/.venvs')

system('/bin/sh ~/.osx')

