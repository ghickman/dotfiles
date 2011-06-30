set nocompatible

" Load plugins
if version >= 703
  filetype off
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on
endif

set modelines=0

" Tab settings.
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set tw=0

" Turn basics on
set autoindent
set backspace=indent,eol,start
set backupcopy=yes " Preserve resource fork
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set number
set ruler
set scrolloff=3
set showcmd
set showmode
set ttyfast
set undofile
"set visualbell
set wildmenu
set wildignore+=*.o,*.obj,.git,*.class
set wildmode=list:longest

" Turn off basics
set noerrorbells
set nospell
set novisualbell

" Set the leader to ,
let mapleader = ","

" Destroy the use of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" remap ; -> : to make commands easier to type
nnoremap ; :

" Save on lost focus
au FocusLost * :wa

" Show tabs
set list
set listchars=tab:▸\

" Sort!
nnoremap <leader>s ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Set filetype to htmldjango
nnoremap <leader>sd :set ft=htmldjango<CR>

" Colour scheme
colorscheme vwilight

" Searching.
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlighting.
map <leader><space> :nohls<CR><C-L>

" Syntax error signs
let g:syntastic_enable_signs=1

" More syntax highlighting for Python
let python_highlight_all = 1

" Keep a long history.

" Backspace
set backspace=indent,eol,start

" NERDTree.
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>

" Command-T.
let g:CommandTMaxHeight=20

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

au FileType markdown set wrap

" Ruby have different indent settings.
au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2

" Additional files that should be Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby

" Additional files that should be Python
au BufRead,BufNewFile {requirements.txt} set ft=python

" Smart indenting
set smartindent cinwords=class,elif,else,except,def,finally,for,if,try,while

" PHP highlight settings
au FileType php let php_sql_query=1
au FileType php let php_htmlInStrings=1

" Mappings to expand the current path (edit, split, vsplit)
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Highlight long lines - only care about this in Vim 7.3+ now
if version >= 703
  highlight ColorColumn ctermbg=lightgrey guibg=#464646
  "set cc=+1 tw=80
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

let g:SimplenoteUsername = "george+simplenote@ghickman.co.uk"
let g:SimplenotePassword = "J62.DYN7a3{ni/=e"

