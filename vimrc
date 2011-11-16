" Preamble --------------------------------------------------------------- {{{

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set nocompatible

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" }}}
" Basics ------------------------------------------------------------------ {{{

set autoindent
set backspace=indent,eol,start
set backupcopy=yes " Preserve resource fork
set dictionary=/usr/share/dict/words
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set modelines=0
set noerrorbells
set nospell
set novisualbell
set number
set ruler
set showcmd
set showmode
set splitbelow
set splitright
set ttyfast
set undofile
set undoreload=10000

" Wildmenu Completion ---------------------------------------------------- {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.git,.hg,.svn                            " Version control
set wildignore+=*.bmp,*.gif,*.jpg,*.jpeg,*.png           " Binary images
set wildignore+=*.class,*.dll,*.exe,*.manifest,*.o,*.obj " Compiled object files
set wildignore+=*.spl                                    " Compile spelling word lists
set wildignore+=*.DS_Store                               " OSX
set wildignore+=*.pyc                                    " Python byte code

" }}}

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Tabs, spacing, etc ----------------------------------------------------- {{{

set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=0

" }}}
" Backups {{{

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" }}}
" Leader ------------------------------------------------------------===== {{{

let mapleader = ","
" let localleader = "\\"

" }}}
" Color Scheme ----------------------------------------------------------- {{{

syntax on
colorscheme vwilight

" }}}

" }}}
" Movement --------------------------------------------------------------- {{{

" Destroy the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make life easier
nnoremap j gj
nnoremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" }}}
" Search ----------------------------------------------------------------- {{{

set hlsearch
set incsearch
set ignorecase
set smartcase

" Clear search highlighting.
map <leader><space> :nohls<cr>:call clearmatches()<cr>

" }}}
" Status Line {{{

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

augroup ft_statuslinecolor
    au!

    " colour the status line
    au InsertEnter * hi StatusLine term=reverse ctermbg=5
    au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
augroup END

" }}}
" Convenience mappings --------------------------------------------------- {{{

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Sort!
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Set filetype to htmldjango
nnoremap <leader>sd setlocal ft=htmldjango<CR>

" Add the two lines below to this one and get rid of the fucking spaces.
nnoremap <leader>jl JxJxj<cr>

" Toggle a fold
nnoremap <leader>f za

" Open all Folds
nnoremap <leader>F zR

" Faster Esc
inoremap jk <esc>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Map f1 to leave insert/visual mode
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Quick return
inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

" Split/Join {{{
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
" }}}
" Handle URL {{{
" Stolen from https://github.com/askedrelic/homedir/blob/master/.vimrc
" OSX only: Open a web-browser with the URL in the current line
function! HandleURI()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
        exec "!open \"" . s:uri . "\""
    else
        echo "No URI found in line."
    endif
endfunction
map <leader>u :call HandleURI()<CR>
" }}}

" }}}
" Quick Editing ---------------------------------------------------------- {{{

nnoremap <leader>ev <c-w>v:edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}
" Filetype Specific Stuff ------------------------------------------------ {{{

" CSS and SCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.scss setlocal filetype=scss

    au Filetype scss,css setlocal foldmethod=marker
    au Filetype scss,css setlocal foldmarker={,}
    au Filetype scss,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype scss,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "     }
    " au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}}
" HTML and HTMLDjango {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use Shift-Return to turn this:
    "     <tag>|</tag>
    "
    " into this:
    "     <tag>
    "         |
    "     </tag>
    au FileType html,jinja,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown
    au BufNewFile,BufRead *.md setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>

    au FileType markdown setlocal wrap
    au FileType markdown map j gj
    au FileType markdown map k gk
    au FileType markdown setlocal spell spelllang=en_gb
augroup END

" }}}
" Nginx {{{

augroup ft_nginx
    au!

    au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
    au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
    au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
    au BufRead,BufNewFile vhost.nginx                            set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" Puppet {{{

augroup ft_puppet
    au!

    au Filetype puppet setlocal foldmethod=marker
    au Filetype puppet setlocal foldmarker={,}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    " Additional files that should be Python
    au BufNewFile,BufRead {dev_,}requirements.txt setlocal filetype=python
    " au BufNewFile,BufRead dev_requirements.txt setlocal filetype=python

    " au Filetype python noremap  <buffer> <localleader>rr :RopeRename<CR>
    " au Filetype python vnoremap <buffer> <localleader>rm :RopeExtractMethod<CR>
    " au Filetype python noremap  <buffer> <localleader>ri :RopeOrganizeImports<CR>

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    " au FileType python compiler nose
    " au FileType man nnoremap <buffer> <cr> :q<cr>

    " More syntax highlighting for Python
    let python_highlight_all = 1
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr`
augroup END

" }}}
" Ruby {{{

augroup ft_ruby
    au!

    " Additional files that should be Ruby
    au BufNewFile,BufRead {Gemfile,Rakefile,Thorfile,config.ru} set filetype=ruby

    au Filetype ruby setlocal foldmethod=syntax
    au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" }}}
" Vagrant {{{

augroup ft_vagrant
    au!

    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78

    " Display help in a vsplit
    " au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" }}}
" Plugin Specific stuff -------------------------------------------------- {{{

" Ack {{{

map <leader>a :Ack<space>

" }}}
" Command-T {{{

let g:CommandTMaxHeight=20

" }}}
" Commentary {{{

nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary
au FileType htmldjango setlocal commentstring={#\ %s\ #}

" }}}
" Fugitive --------------------------------------------------------------- {{{

nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<cr>

" }}}
" NERDTree {{{

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" }}}
" Syntastic {{{

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes=['javascript',]

" }}}
" Pyflakes {{{

" Don't use quickfix list, it interferes with Ack
let g:pyflakes_use_quickfix = 0

" }}}
" Threesome {{{

" See https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc#cl-1087
" for more!
let g:threesome_initial_mode = "grid"
let g:threesome_wrap = "nowrap"

" }}}

" }}}

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

