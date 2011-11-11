" Colour scheme
colorscheme vwilight

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

" `gf` jumps to the filename under the cursor. Point at an import statement
" and jump to it!
python << EOF
from os.path import isdir
from sys import path

from vim import command
for p in path:
    if isdir(p):
        command(r'set path+=%s' % (p.replace(' ', r'\ ')))
EOF

" Execute a selection of code. Select a range and use ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()

endif

" Start without the toolbar
set guioptions-=T

" Get rid of all scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

set guifont=Monaco:h12
set vb

