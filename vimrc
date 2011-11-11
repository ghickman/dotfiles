set nocompatible

colorscheme vwilight

" LOAD PLUGINS
if version >= 703
  filetype off
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on
endif

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
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
set undoreload=10000
set wildmenu
set wildignore+=*.o,*.obj,.git,*.class,.hg,.pyc
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

" Map f1 to leave insert/visual mode
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Status Line
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\ \  " Space.

set statusline+=%#warningmsg#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" Line and column position and counts.
set statusline+=\ (%L)\ %03l,%03c

set statusline+=\ \  " Space.

" Git
set statusline+=%{fugitive#statusline()}

set statusline+=\ \  " Space.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).

set statusline+=\ \  " Space.


" Backups
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" Show tabs
set list
set listchars=tab:▸\

" colour the status line
au InsertEnter * hi StatusLine term=reverse ctermbg=5
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse


" MAPPINGS
" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Edit vimrc
nnoremap <leader>ev <c-w>v:edit $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Sort!
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Set filetype to htmldjango
nnoremap <leader>sd :set ft=htmldjango<CR>

" Add the two lines below to this one and get rid of the fucking spaces.
nnoremap <leader>jl JxJxj<cr>

" Searching.
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlighting.
map <leader><space> :nohls<CR><C-L>

" Set hypenated css declarations as key words
au Filetype css setlocal iskeyword+=-

" Dictionary words!
:set dictionary=/usr/share/dict/words

" More syntax highlighting for Python
let python_highlight_all = 1

au FileType markdown setlocal wrap
au FileType markdown map j gj
au FileType markdown map k gk
au FileType markdown setlocal spell spelllang=en_gb

au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2

" Additional files that should be Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby

" Additional files that should be Python
au BufRead,BufNewFile {requirements.txt} set ft=python

" Smart indenting
set smartindent cinwords=class,elif,else,except,def,finally,for,if,try,while

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


" PLUGIN SPECIFIC BITS
" Ack
map <leader>a :Ack<space>

" Command-T.
let g:CommandTMaxHeight=20

" Commenting
nnoremap <localleader>c \\\

" Gundo Toggle
nnoremap <leader>u :GundoToggle<cr>

" NERDTree.
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" SimpleNote
let g:SimpleNoteUserName = "george+simplenote@ghickman.co.uk"
let g:SimpleNotePassword = "J62.DYN7a3{ni/=e"

" Syntax error signs
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes=['javascript',]

" Pyflakes don't use quickfix list
let g:pyflakes_use_quickfix = 0

