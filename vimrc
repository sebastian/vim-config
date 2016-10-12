"================== DEIN init script ===================================

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim/


" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:

" -- adds sane defaults
call dein#add('tpope/vim-sensible')
" -- creates a dir if missing...
call dein#add('jordwalke/VimAutoMakeDirectory')
" -- for git integration and support
call dein#add('tpope/vim-repeat.git')
" -- improved markdown support
call dein#add('tpope/vim-markdown.git')
" -- NERDTree for browsing files
call dein#add('scrooloose/nerdtree')
" -- To balance the size of splits
call dein#add('jordwalke/VimSplitBalancer.git')
" -- Powerline, but not so heavy weight, apparently
call dein#add('jordwalke/vim-airline')
" -- Syntax highlighting and errors
call dein#add('scrooloose/syntastic')
" -- Colour schemes
call dein#add('jordwalke/flatlandia')
call dein#add('altercation/vim-colors-solarized')
" -- CTRLP
call dein#add('ctrlpvim/ctrlp.vim.git')
" -- auto-completion
call dein#add('jordwalke/AutoComplPop.git')
call dein#add('SirVer/ultisnips.git')
call dein#add('jordwalke/VimCompleteLikeAModernEditor')
" -- elixir highlighting
call dein#add('elixir-lang/vim-elixir')
" -- commeting out code
call dein#add('tpope/vim-commentary.git')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"=======================================================================

"================== General config =====================================
source ~/.vim/configs/general
"=======================================================================

"================== Config of plugins ==================================
source ~/.vim/configs/nerdTreeVimRc
source ~/.vim/configs/vimAirline
source ~/.vim/configs/syntastic
source ~/.vim/configs/ctrlp
source ~/.vim/configs/vimCompleteLikeAModernEditor
source ~/.vim/configs/merlin
"=======================================================================
