" Plugins ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'akinsho/bufferline.nvim'
Plug 'andrewRadev/splitjoin.vim'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish'
Plug 'docunext/closetag.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'foosoft/vim-argwrap'
Plug 'godlygeek/tabular'
Plug 'google/vim-searchindex'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'indianboy42/tree-sitter-just', { 'do': ':TSUpdate', 'for': 'just' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kalekundert/vim-coiled-snake', { 'for': 'python' , 'branch': 'fix-37' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact'] }
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
Plug 'neomake/neomake'
Plug 'neovim/nvim-lspconfig'
Plug 'noahtheduke/vim-just', { 'for': 'just' }
Plug 'nvim-tree/nvim-web-devicons'  " for bufferline icons
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }
Plug 'preservim/vim-markdown'
Plug 'rareitems/put_at_end.nvim'
Plug 'sbdchd/neoformat'
Plug 'scy/vim-mkdir-on-write'
Plug 'sjl/splice.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/matchit.zip'
Plug 'windwp/nvim-autopairs'
Plug 'yuezk/vim-js', { 'for': ['javascript', 'javascriptreact'] }

" Add plugins to &runtimepath
call plug#end()

" }}}
" Basics ----------------------------------------------------------------- {{{

set backupcopy=yes " Preserve resource fork
set dictionary=/usr/share/dict/words
set linebreak
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
set mouse=""
set joinspaces
set number
set splitbelow
set splitright
set termguicolors
set title
set updatetime=100

" Tell vim to use bash
if &shell =~# 'fish$'
    set shell=bash
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Time out on key codes but not mappings.
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

" NeoVim 0.7 started distinguishing modifier keys correctly so need to
" manually map this to save retraining years of accidental muscle memory.
nnoremap <C-;> :

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

set complete=.,b,u,]
set completeopt=menu,preview

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

set noswapfile                    " apparently it's 2012
set backup                        " enable backups
set backupdir=~/.vim/tmp/backup// " where to store backups
set undofile                      " store undos in a file
set undodir=~/.vim/tmp/undo//     " where to store undo files
set undoreload=10000              " store lots of undos

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

let g:coiled_snake_explicit_sign_width=2

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

" Quick return
inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

nnoremap gp `[v`]

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
    " au BufNewFile,BufRead *.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.sass,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

    " Use prettier to format style files
    au BufWritePre *.css Neoformat
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

    au FileType html,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use Shift-Return to turn this:
    "     <tag>|</tag>
    "
    " into this:
    "     <tag>
    "         |
    "     </tag>
    au FileType html,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Django tags
    au FileType htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au BufRead,BufNewFile *.js,*.jsx set suffixesadd+=.js

    " Pretty-print JSON files with Python (& remove the trailing whitespace that
    " Python <2.7 json module adds, sigh)
    nmap <leader>J :%!python -m json.tool<CR>:%s/\s\+$//g<CR>

    au FileType javascript,javascriptreact setlocal foldmethod=expr
    au FileType javascript,javascriptreact setlocal foldexpr=nvim_treesitter#foldexpr()

    au FileType javascript nnoremap <leader>d odebugger;<esc>

    " Use prettier to format JS files
    au BufWritePre *.js,*.jsx Neoformat

    " Defer to import-sort for sorting JavaScript imports (instead of using Unix sort)
    au FileType javascript,javascriptreact nnoremap <leader>S mX:!import-sort --write %<cr>`X

    " Scaffold new files
    au BufNewFile *.jsx 0r ~/.vim/templates/jsx
augroup END

" }}}
" JSON {{{

augroup ft_json
    au!

    " set up folding for JSON files
    au FileType json setlocal foldmethod=syntax
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

    " Use custom wrapper around MacOS dictionary as keyword look-up
    au FileType markdown setlocal keywordprg=open-dict.sh

    let g:markdown_fenced_languages = ["python", "sh"]
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

    au Filetype python nnoremap <leader>d obreakpoint()<esc>
    au Filetype python nnoremap <leader>id oimport ipdb;ipdb.set_trace()<esc>

    au BufWritePre *.py lua vim.lsp.buf.format()
    au BufWritePre *.py lua vim.lsp.buf.execute_command({ command = 'ruff.applyOrganizeImports', arguments = { { uri = vim.uri_from_bufnr(0), version = 1 } } })
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

    au FileType vim lua vim.treesitter.start()
augroup END

" }}}

" }}}
" Plugin Specific stuff -------------------------------------------------- {{{

" ArgWrap {{{

let g:argwrap_tail_comma = 1
nnoremap <leader>w :ArgWrap<cr>

" }}}
" Autoclose {{{
lua << EOF

require("nvim-autopairs").setup {}

EOF
" }}}
" Bufferline {{{

lua << EOF
require("bufferline").setup {
    options = {
        show_buffer_close_icons = false,
    }
}
EOF

" }}}
" Commentary {{{

nmap <leader>c gcc
xmap <leader>c gc
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType python setlocal commentstring=#\ %s

" }}}
" EasyAlign {{{

vmap <Enter> <Plug>(EasyAlign)

" }}}
" Expand Region {{{

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}}
" Fugitive {{{

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" }}}
" EasyMotion {{{

let g:EasyMotion_verbose = 0

" }}}
" FZF {{{

let g:fzf_buffers_jump = 1

nnoremap <leader>t :FZF<cr>
nnoremap <leader>f :Buffers<cr>
nnoremap <leader>. :Tags<cr>

" }}}
" GitGutter {{{

let g:gitgutter_set_sign_backgrounds = 1

" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<cr>

" }}}
" LSP {{{
lua << EOF
local on_attach = function(client, bufnr)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

local nvim_lsp = require("lspconfig")

nvim_lsp.esbonio.setup({
  on_attach = on_attach,
  cmd = {"esbonio"}
})

nvim_lsp.pylsp.setup({
  enable = true,
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        jedi_completion = {fuzzy = true},
      }
    }
  }
})

nvim_lsp.ruff.setup({})

nvim_lsp.biome.setup({})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "flow", "ts_ls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" }}}
" Markdown {{{

" Enable folding.
let g:vim_markdown_folding_disabled = 0

" Fold heading in with the contents.
let g:vim_markdown_folding_style_pythonic = 1

" Autoshrink TOCs.
let g:vim_markdown_toc_autofit = 1

" Indentation for new lists. We don't insert bullets as it doesn't play
" nicely with `gq` formatting. It relies on a hack of treating bullets
" as comment characters.
" See https://github.com/plasticboy/vim-markdown/issues/232
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Filetype names and aliases for fenced code blocks.
let g:vim_markdown_fenced_languages = ['bash=sh', 'js=javascript', 'py=python']

" Highlight front matter (useful for Hugo posts).
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1

" Format strike-through text (wrapped in `~~`).
let g:vim_markdown_strikethrough = 1

" }}}
" Neoformat {{{

let g:neoformat_run_all_formatters = 1
let g:neoformat_try_formatprg = 1

let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_jsx = ['prettier']
let g:neoformat_enabled_python = []

" }}}
" Neomake {{{

let g:neomake_dockerfile_enabled_makers = ['hadolint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascriptreact_enabled_makers = ['eslint']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_python_enabled_makers = []

" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

" }}}
" Put at end {{{
lua <<EOF

local m = require("put_at_end")

vim.keymap.set("n", "<C-,>", m.put_comma)

EOF
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

" }}}
" Treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "bash",
      "dockerfile",
      "fish",
      "html",
      "htmldjango",
      "javascript",
      "json",
      "make",
      "python",
      "rst",
      "toml",
      "yaml",
  },
  indent = {
    disable = {"python", },
  },
textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>l"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>h"] = "@parameter.inner",
      },
    },
  },
}

require('tree-sitter-just').setup{}
EOF
" }}}

" }}}
