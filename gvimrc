if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
endif

" Start without the toolbar
set guioptions-=T

set guifont=Monaco:h12
set vb

