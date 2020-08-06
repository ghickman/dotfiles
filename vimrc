" Plugins ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'andrewRadev/splitjoin.vim'
Plug 'ap/vim-buftabline'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'curist/vim-angular-template'
Plug 'dag/vim-fish'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'docunext/closetag.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'foosoft/vim-argwrap'
Plug 'google/vim-searchindex'
Plug 'groenewege/vim-less'
Plug 'hashivim/vim-terraform'
Plug 'hynek/vim-python-pep8-indent'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kalekundert/vim-coiled-snake'
Plug 'konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'rking/ag.vim'
Plug 'sbdchd/neoformat'
Plug 'scy/vim-mkdir-on-write'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'simnalamburt/vim-mundo'
Plug 'sjl/splice.vim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'terryma/vim-expand-region'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/matchit.zip'
Plug 'yuezk/vim-js'

" Add plugins to &runtimepath
call plug#end()

" }}}
" Basics ----------------------------------------------------------------- {{{

set autoindent
set autoread
set backspace=indent,eol,start
set backupcopy=yes " Preserve resource fork
set dictionary=/usr/share/dict/words
set hidden
set history=1000
set inccommand=nosplit
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
set mouse=""
set noerrorbells
set nojoinspaces
set nomodeline
set nospell
set novisualbell
set number
set ruler
set showcmd
set showmode
set splitbelow
set splitright
set termguicolors
set title
set undofile
set undoreload=10000
set updatetime=100

" Tell vim to use bash
if &shell =~# 'fish$'
    set shell=bash
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Remember last location in file
au BufReadPost *
    \ if &filetype != "gitcommit" &&
    \   line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" Python support
let g:python_host_prog='/Users/george/.pyenv/shims/python2'
let g:python3_host_prog='/Users/george/.pyenv/shims/python3'

" Flip ` & ', makes jumping back to specific place easier
nnoremap ' `
nnoremap ` '

" }}}
" Autosave --------------------------------------------------------------- {{{

" Save all buffers on focus lost and no input
au FocusLost * :silent! wall
au CursorHold * :silent! wall

" Write to disk when navigating file
set autowrite

" Write when leaving a buffer
augroup AutoWrite
    autocmd! BufLeave * :update
augroup END

" }}}
" Completion ------------------------------------------------------------- {{{

let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
set completeopt-=preview
call deoplete#custom#option('auto_complete', v:false)

" Enhance command completion
set wildmenu
set wildmode=longest,list:longest

set wildignore+=.git,.hg,.svn                            " Version control
set wildignore+=*.bmp,*.gif,*.jpg,*.jpeg,*.png           " Binary images
set wildignore+=*.class,*.dll,*.exe,*.manifest,*.o,*.obj " Compiled object files
set wildignore+=*.spl                                    " Compile spelling word lists
set wildignore+=*.DS_Store                               " OSX
set wildignore+=*.pyc                                    " Python byte code
set wildignore+=*.egg-info                               " Python deployment info
set wildignore+=.tox                                     " Tox (virtualenv testing)
set wildignore+=.sass-cache                              " Sass cache folder

" shortcut linewise completion
inoremap <c-l> <c-x><c-l>

" }}}
" Spacing ---------------------------------------------------------------- {{{

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

" Make those folders automatically if they don't exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

" }}}
" Leader ----------------------------------------------------------------- {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}
" Color Scheme ----------------------------------------------------------- {{{

syntax on
colorscheme dracula

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Folding ---------------------------------------------------------------- {{{

set foldlevelstart=0

" Toggle a fold
nnoremap <space> za

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
nnoremap <leader>z mzzMzvzz`z

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
" Terminal --------------------------------------------------------------- {{{

" Exit terminal insert mode with ,+e
tnoremap <Leader>e <C-\><C-n>

" }}}
" Trailing Whitespace ---------------------------------------------------- {{{

" Based on https://github.com/bronson/vim-trailing-whitespace

" Ignore some filetypes
let g:whitespace_ignored_filetypes = ['mail']

function! ShouldMatchWhitespace()
    for ft in g:whitespace_ignored_filetypes
        if ft ==# &filetype | return 0 | endif
    endfor
    return 1
endfunction

function! EnableWhitespace()
    let w:twsm = matchadd('TrailingWhitespace', '\s\+$')
endfunction

highlight link TrailingWhitespace Search
autocmd BufWinEnter * if ShouldMatchWhitespace() |
  \ silent! call EnableWhitespace() |
  \ endif

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

set scrolloff=999
set sidescroll=1
set sidescrolloff=10

" Make window navigation a little snappier
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

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

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Set filetype to htmldjango
nnoremap <leader>sd :setlocal ft=htmldjango<CR>

" Add the two lines below to this one and get rid of the fucking spaces.
nnoremap <leader>jl JxJxj<cr>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Quick return
inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

" Send visual selection to gist.github.com
" Requires gist (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>

nnoremap gp `[v`]

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

" CSS and Style Preprocessors {{{

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

    " Use prettier to format style files
    au BufWritePre *.css,*.less Neoformat
augroup END

" }}}
" Git {{{

augroup git_files
    au!

    " Don't remember last cursor position in git commit messages
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
augroup END

" }}}
" HTML and HTML derivatives {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *jinja2.html setlocal filetype=htmldjango

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

    au BufRead,BufNewFile *.js,*.jsx set suffixesadd+=.js

    " Pretty-print JSON files with Python (& remove the trailing whitespace that
    " Python <2.7 json module adds, sigh)
    nmap <leader>J :%!python -m json.tool<CR>:%s/\s\+$//g<CR>

    au FileType javascript,javascriptreact setlocal foldmethod=syntax

    au FileType javascript nnoremap <leader>d odebugger;<esc>

    " Use prettier to format JS files
    au BufWritePre *.js,*.jsx Neoformat

    " Defer to import-sort for sorting JavaScript imports (instead of using Unix sort)
    au FileType javascript,javascriptreact nnoremap <leader>S mX:!import-sort --write %<cr>`X

    " Scaffold new files
    au BufNewFile *.jsx 0r ~/.vim/templates/jsx
augroup END

" }}}
" LESS {{{

augroup ft_less
    au!

    au Filetype less inoremap <c-cr> <esc>A {<cr>}<esc>O
augroup END

" }}}
" Mail {{{

augroup ft_mail
    au!

    au FileType mail setlocal fo+=aw
    au FileType mail setlocal listchars-=trail:·
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

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType python setlocal foldnestmax=1

    " More syntax highlighting for Python
    let python_highlight_all = 1

    " Insert a docstring
    au Filetype python nnoremap <leader>" o""""""<esc>hhi

    au Filetype python nnoremap <leader>d oimport pdb;pdb.set_trace()<esc>
    au Filetype python nnoremap <leader>id oimport ipdb;ipdb.set_trace()<esc>

    au Filetype python nnoremap <leader>S mX:%! isort -<cr>`X

    " Use black to format Python files
    au BufWritePre *.py Neoformat
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yyPVr=jpVr=
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr^
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr"

    au Filetype rst nnoremap <buffer> <localleader>i 0vyPr*$vypr*

    au Filetype rst inoremap <buffer> <c-t> :ref:``<left>

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

" }}}
" Plugin Specific stuff -------------------------------------------------- {{{

" Ag {{{

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    nnoremap <leader>a :Ag<space>
endif

" }}}
" ArgWrap {{{

let g:argwrap_tail_comma = 1
nnoremap <leader>w :ArgWrap<cr>

" }}}
" Buftabline {{{

let g:buftabline_indicators = 1
let g:buftabline_numbers = 1
let g:buftabline_separators = 1

" }}}
" Commentary {{{

nmap <leader>c gcc
xmap <leader>c gc
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType python setlocal commentstring=#\ %s

" }}}
" Dracula {{{

" hi Folded guibg=#343746 guifg=#a0a8b0

" }}}
" EasyAlign {{{

vmap <Enter> <Plug>(EasyAlign)

" }}}
" Expand Region {{{

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}}
" Fugitive {{{

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gpl :Git pull<cr>
nnoremap <leader>gs :Gstatus<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" }}}
" FZF {{{

let g:fzf_buffers_jump = 1

nnoremap <leader>t :FZF<cr>
nnoremap <leader>f :Buffers<cr>
nnoremap <leader>. :Tags<cr>

" }}}
" Gist {{{

if executable("gist")
    let g:gist_clip_command = 'pbcopy'
    let g:gist_detect_filetype = 1
    let g:gist_post_private = 1
endif

" }}}
" GitGutter {{{

let g:gitgutter_set_sign_backgrounds = 1

" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<cr>

" }}}
" Neoformat {{{

let g:neoformat_run_all_formatters = 1
let g:neoformat_try_formatprg = 1

let g:neoformat_css_prettier        = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_htmldjango_prettier = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_javascript_prettier = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_javascriptreact_prettier = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_jsx_prettier        = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_less_prettier       = {'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1}
let g:neoformat_enabled_python = ['black', 'isort']
let g:neoformat_enabled_javascriptreact = ['prettier']

" }}}
" Neomake {{{

let g:neomake_javascript_enabled_makers = ['eslint_d', 'flow']
let g:neomake_dockerfile_enabled_makers = ['hadolint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_yaml_enabled_makers = ['yamllint']

let g:neomake_javascriptreact_eslint_d_maker = {
      \ 'args': ['--format=compact'],
      \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
      \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
      \ 'cwd': '%:p:h',
      \ 'output_stream': 'stdout',
      \ }
let g:neomake_javascriptreact_flow_maker = {
      \ 'args': ['--from=vim', '--show-all-errors'],
      \ 'errorformat':
      \   '%-GNo errors!,'
      \   .'%EFile "%f"\, line %l\, characters %c-%m,'
      \   .'%trror: File "%f"\, line %l\, characters %c-%m,'
      \   .'%C%m,%Z',
      \ 'postprocess': function('neomake#makers#ft#javascript#FlowProcess')
      \ }
let g:neomake_javascriptreact_enabled_makers = ['eslint_d', 'flow']

au BufWritePost * Neomake

" }}}
" Splice {{{

" See https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc#cl-1087
" for more!
let g:splice_initial_mode = "grid"
let g:splice_initial_layout_grid = "1"
let g:splice_wrap = "nowrap"

" }}}
" SuperTab {{{

let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" Terraform {{{

let g:terraform_fmt_on_save=1

" }}}

" }}}
