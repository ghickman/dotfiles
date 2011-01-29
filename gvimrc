if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

" `gf` jumps to the filename under the cursor. Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
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

set guifont=Monaco:h12
set vb

