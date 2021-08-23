# Jobs
alias j jobs

# Vim
alias v nvim
alias vim nvim

# Django
alias pym 'python manage.py'
alias pymrs 'python manage.py runserver'
alias pymrs+ 'python manage.py runserver_plus'
alias pyms 'python manage.py shell'
alias pyms+ 'python manage.py shell_plus'

# Flush Directory Service cache
alias flush 'dscacheutil -flushcache'

# Mutt
alias e 'cd ~/Desktop && neomutt'
alias ffs 'pkill -9 -f offlineimap.py'

# speed up direnv usage
alias da 'direnv allow'

# ffs
alias p1 'ping 192.168.0.1 | ts'
alias p2 'ping 192.168.10.1 | ts'
alias p8 'ping 8.8.8.8 | ts'

# brew
alias b 'brew update && brew upgrade'

# offlineimap
alias o 'PYTHONPATH="/usr/local/Cellar/offlineimap/7.3.4/libexec/vendor/lib/python2.7/site-packages" python2 /usr/local/Cellar/offlineimap/7.3.4/libexec/offlineimap.py'

# pip
alias pipr 'pip install -r requirements.prod.txt'
alias pipd 'pip install -r requirements.dev.txt'

# pytest
alias pytlf 'pytest --lf'
