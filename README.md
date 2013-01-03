These are my configuration files for Vim. I've placed them on Github so that I can keep all my machines up-to-date, however it's always good to share.

I run this on Vim 7.3 (and above), should work fine with Vim 7.2 also.

It includes more up-to-date version of:

* [vim-ruby](http://github.com/vim-ruby/vim-ruby)
* [vim-git](http://github.com/tpope/vim-git)
* [vim-haml](http://github.com/tpope/vim-haml)
* [vim-markdown](http://github.com/tpope/vim-haml)
* [delimitMate](http://github.com/Raimondi/delimitMate)

### I'd like to try it, but how?

Clone this repo into your home directory and initialise the snippets submodule.

    cd ~
    git clone http://github.com/RichGuk/vim-files.git .vim
    cd ~/.vim
    git submodule init
    git submodule update

Then in your ~/.vimrc and ~/.gvimrc add the following lines before any personal settings:

**.vimrc**:

    source ~/.vim/vimrc
    ...

**.gvimrc**:

    source ~/.vim/gvimrc
    ...
