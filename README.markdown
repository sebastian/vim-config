Quick install:

Clone the git repository:

    git clone git://github.com/sebastian/vim-config.git ~/.vim

Now get the bundles:

    cd ~/.vim
    git submodule init
    git submodule update

Setup your .vimrc and .gvimrc

    cd ~/
    ln -s .vim/vimrc .vimrc
    ln -s .vim/gvimrc .gvimrc

That should be it.
