set nocompatible

if version >= 703
  filetype off
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
endif

set number
set ruler
syntax on

" Spelling off
set nospell

" Tab settings.
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Show tabs and new line 'hidden' characters.
set list listchars=tab:▸\

" Searching.
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlighting.
map <Leader>sc :nohls<CR><C-L>

" Preserve resource fork
set backupcopy=yes

" Tab complietion.
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.class

" Status bar.
set laststatus=2

" Syntax error signs
let g:syntastic_enable_signs=1

" Keep a long history.
set history=1000

" NERDTree.
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>

" Command-T.
let g:CommandTMaxHeight=20

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Load plugins
filetype plugin indent on

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Python/PHP have different indent settings.
au FileType python set tabstop=4 softtabstop=4 shiftwidth=4
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4

" Additional files that should be Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby

" Additional files that should be Python
au BufRead,BufNewFile {requirements.txt} set ft=python

" Backspace
set backspace=indent,eol,start

" Remove bells
set novisualbell
set noerrorbells

" PHP highlight settings
au FileType php let php_sql_query=1
au FileType php let php_htmlInStrings=1

" Bind some nicer mappings for bubbling text up and down.
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Mappings to expand the current path (edit, split, vsplit)
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Remove trailing whitespace
command RMTWS :execute '%s/\s\+$//e'

" Colour scheme
colorscheme vwilight

" Highlight long lines - only care about this in Vim 7.3+ now
if version >= 703
  highlight ColorColumn ctermbg=lightgrey guibg=#464646
  set cc=+1 tw=80
  " Provide a way to turn it off and on
  nnoremap <Leader>l
    \ :if &cc != '0'<Bar>
    \   set cc=0<Bar>
    \ else<Bar>
    \   set cc=+5<Bar>
    \ endif<CR>
endif

" Highlight trailing whitespace.
hi link TrailingWhiteSpace Search
au BufWinEnter * let w:twsm=matchadd('TrailingWhiteSpace', '\s\+$')
" Setup a toggle.
nnoremap <silent> <Leader>w
  \ :if exists('w:twsm') <Bar>
  \   silent! call matchdelete(w:twsm) <Bar>
  \   unlet w:twsm <Bar>
  \ else <Bar>
  \   let w:twsm = matchadd('TrailingWhiteSpace', '\s\+$') <Bar>
  \ endif<CR>

hi CursorColumn term=underline cterm=underline guibg=#333435
" hidden carriage return character
hi NonText ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE
" hidden tab character
hi SpecialKey ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE

