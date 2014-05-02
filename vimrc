" Preamble --------------------------------------------------------------- {{{

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set nocompatible

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" }}}
" Basics ----------------------------------------------------------------- {{{

set autoindent
set backspace=indent,eol,start
set backupcopy=yes " Preserve resource fork
set dictionary=/usr/share/dict/words
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set linebreak
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set modelines=0
set noerrorbells
set nojoinspaces
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

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Autosave --------------------------------------------------------------- {{{

" Save all buffers on GUI window focus lost
au FocusLost * :silent! wall

" Write to disk when navigating file
set autowrite

" Write when leaving a buffer
augroup AutoWrite
    autocmd! BufLeave * :update
augroup END

" }}}
" Wildmenu Completion ---------------------------------------------------- {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.git,.hg,.svn                            " Version control
set wildignore+=*.bmp,*.gif,*.jpg,*.jpeg,*.png           " Binary images
set wildignore+=*.class,*.dll,*.exe,*.manifest,*.o,*.obj " Compiled object files
set wildignore+=*.spl                                    " Compile spelling word lists
set wildignore+=*.DS_Store                               " OSX
set wildignore+=*.pyc                                    " Python byte code
set wildignore+=*.egg-info                               " Python deployment info
set wildignore+=.tox                                     " Tox (virtualenv testing)
set wildignore+=.sass-cache                              " Sass cache folder

" }}}
" Tabs, spacing, etc ----------------------------------------------------- {{{

set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=0

" }}}
" Backups ---------------------------------------------------------------- {{{

set backup                        " enable backups
set noswapfile                    " apparently it's 2012
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" Leader ----------------------------------------------------------------- {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}
" Color Scheme ----------------------------------------------------------- {{{

syntax on
set background=dark
colorscheme solarized

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Folding ---------------------------------------------------------------- {{{

set foldlevelstart=0

" Sane current location
nnoremap <c-cr> zvzz

" Toggle a fold
nnoremap <leader>f za

" Open all Folds
nnoremap <leader>F zR

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
nnoremap <leader>w mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" Buffer/Window Width ---------------------------------------------------- {{{

set winwidth=80
autocmd WinEnter * wincmd =
autocmd VimResized * wincmd =

" }}}
" Trailing Whitespace ---------------------------------------------------- {{{

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

" }}}
" Highlight cursor ------------------------------------------------------- {{{

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" }}}
" Toggle Paste Mode ------------------------------------------------------ {{{

nnoremap <leader>p :set invpaste paste?<cr>

" }}}

" }}}
" GUI -------------------------------------------------------------------- {{{

if has('gui_running')
    set guifont=Monaco\ for\ Powerline:h13

    " Get rid of UI cruft
    set guioptions-=b
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=T

    if has('gui_macvim')
        " Fullscreen takes up entire screen
        set fuoptions=maxhorz,maxvert

        " Remove the tab bar
        set showtabline=0
    end
end
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

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" Use perl/python style regex in searches
nnoremap / /\v
vnoremap / /\v

" Case-sensitive search only with caps in search string
set ignorecase
set smartcase

" Match while typing
set hlsearch
set incsearch
set showmatch

" Clear search highlighting.
map <leader><space> :nohls<cr>

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

" Send visual selection to gist.github.com
" Requires gist (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>

nnoremap <leader>d oimport pdb;pdb.set_trace()<esc>

nnoremap <leader>b :b#<cr>

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
" Quick Editing {{{

nnoremap <leader>ev <c-w>v:edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}

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
    au BufNewFile,BufRead *.sass,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" HTML and HTML derivatives {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=angular
    au BufNewFile,BufRead *jinja2.html setlocal filetype=htmldjango

    au FileType angular,html,htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au FileType angular,html,htmldjango setlocal foldmethod=manual

    autocmd FileType angular set commentstring=<!--\ %s\ -->

    " Use <localleader>f to fold the current tag.
    au FileType angular,html,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use Shift-Return to turn this:
    "     <tag>|</tag>
    "
    " into this:
    "     <tag>
    "         |
    "     </tag>
    au FileType angular,html,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Django tags
    au FileType htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Angular and Django variables
    au FileType angular,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au BufNewFile,BufRead *.json setlocal filetype=javascript

    " Pretty-print JSON files with Python (& remove the trailing whitespace that
    " Python <2.7 json module adds, sigh)
    nmap <leader>J :%!python -m json.tool<CR>:%s/\s\+$//g<CR>

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
augroup END

" }}}
" LESS {{{

augroup ft_less
    au!

    au FileType less setlocal tabstop=2 softtabstop=2 shiftwidth=2

    au Filetype less inoremap <c-cr> <esc>A {<cr>}<esc>O
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
    au BufRead,BufNewFile nginx_conf_live,nginx_conf_staging     set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    " requirements files
    au BufNewFile,BufRead *requirements.txt setlocal filetype=text nospell

    " au Filetype python noremap  <buffer> <localleader>rr :RopeRename<CR>
    " au Filetype python vnoremap <buffer> <localleader>rm :RopeExtractMethod<CR>
    " au Filetype python noremap  <buffer> <localleader>ri :RopeOrganizeImports<CR>

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType python setlocal foldnestmax=1
    " au FileType python compiler nose
    " au FileType man nnoremap <buffer> <cr> :q<cr>

    " More syntax highlighting for Python
    let python_highlight_all = 1

    " Run nosetests
    au Filetype python noremap <leader>r :!nosetests %<cr>

    " Insert a docstring
    au Filetype python nnoremap <leader>" o""""""<esc>hhi
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr`

    au FileType rst setlocal wrap
    au FileType rst map j gj
    au FileType rst map k gk
augroup END

" }}}
" Ruby {{{

augroup ft_ruby
    au!

    " Additional files that should be Ruby
    au BufNewFile,BufRead {Gemfile,Rakefile,Thorfile,config.ru} setlocal filetype=ruby
    au BufNewFile,BufRead *.sass setlocal filetype=sass

    au Filetype ruby,sass setlocal foldmethod=syntax
    au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78

    " Display help in a vsplit
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" YAML {{{

augroup ft_yaml
    au!

    au FileType yaml,yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" }}}

" }}}
" Plugin Specific stuff -------------------------------------------------- {{{

" Ag {{{

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    nnoremap <leader>a :Ag<space>
endif

" }}}
" Commentary {{{

nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType python setlocal commentstring=#\ %s

" }}}
" CtrlP {{{

let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

 nnoremap <leader>. :CtrlPTag<cr>

" }}}
" Fugitive {{{

nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gpl :Git pull<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" }}}
" Gist {{{

if executable("gist")
    let g:gist_clip_command = 'pbcopy'
    let g:gist_detect_filetype = 1
    let g:gist_post_private = 1
endif

" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<cr>

" }}}
" Khuno {{{

let g:khuno_max_line_length=99
let g:khuno_ignore="E501"

nmap <silent><leader><cr> <esc>:Khuno show<cr>

" }}}
" Powerline {{{

let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_symbols = 'fancy'

" }}}
" Scratch {{{

nnoremap <silent> <leader><tab> :Sscratch<cr>

" }}}
" Selecta {{{

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
  endtry
  redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" map <leader>t :call SelectaCommand("find * -type f", ":e")<cr>

" Find all tags in the tags database, then open the tag that the user selects
command! SelectaTag :call SelectaCommand("awk '{print $1}' tags | sort -u | grep -v '^!'", ":tag")
" map <leader>. :SelectaTag<cr>

" }}}
" Splice {{{

" See https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc#cl-1087
" for more!
let g:splice_initial_mode = "grid"
let g:splice_initial_layout_grid = "1"
let g:splice_wrap = "nowrap"

" }}}
" SuperTab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

" }}}

" }}}
