" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
syntax on
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Don't use swap files, they are annoying!

set tabstop=2                     " Global tab width.
set softtabstop=2
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax shiftwidth=2 tabstop=2
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" The following are taken from the blog post of Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set modelines=0
set encoding=utf-8
set autoindent
set cursorline
set ttyfast

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set textwidth=120
set formatoptions=qrn1
set linebreak
set nolist

" To make it easier to move with visual lines.
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

nnoremap j gj
nnoremap k gk

" Save on lost focus
au FocusLost * :wa

" From David Evans
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au BufNewFile,BufRead *.md setlocal tw=110
  au BufNewFile,BufRead *.md setlocal spell

  au BufNewFile,BufRead *.txt setlocal tw=72
  au BufNewFile,BufRead *.txt setlocal spell

  au BufNewFile,BufRead *.tex setlocal tw=72
  au BufNewFile,BufRead *.tex setlocal spell
  " because I use latex-suite
  au BufNewFile,BufRead *.tex setlocal foldcolumn=5

  au BufNewFile,BufRead *.rb setlocal ts=2 sw=2
  au BufNewFile,BufRead *.rb setlocal spell

  au BufNewFile,BufRead *.erl setlocal ts=2 sw=2
  au BufNewFile,BufRead *.erl setlocal spell

  au BufNewFile,BufRead *.cpp setlocal ts=4 sw=4
  au BufNewFile,BufRead *.cpp setlocal spell
  au BufNewFile,BufRead *.c setlocal ts=4 sw=4
  au BufNewFile,BufRead *.c setlocal spell
endif

imap jj <Esc>

" Toggling between showing an hiding invisible characters
nmap <leader>l :set list!<CR>

"Invisible character colors
highlight NonText guifg=#A9A9A9
highlight SpecialKey guifg=#A9A9A9

" using Source Code Pro
set anti enc=utf-8
set guifont=Source\ Code\ Pro:h12

" Set region to British English
set spelllang=en_gb
" Remember that I can use z= to get suggestions

colorscheme solarized
set background=light

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

autocmd FileType erl set commentstring=\%\ %s
autocmd Syntax erlang set commentstring=\%\ %s
autocmd FileType ex set commentstring=#\ %s
autocmd Syntax elixir set commentstring=#\ %s

" Syntastic settings
" https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Additional syntastic settings from
" http://www.stephendiehl.com/posts/vim_haskell.html
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Changes from http://statico.github.com/vim.html  "
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl-P changes:
" To use Ctrl-P in buffer mode
nmap ; :CtrlPBuffer<CR>

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|beam|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Toggle visibility of tree
nmap \e :NERDTreeToggle<CR>

" Force the right number of colours, if the terminal supports it, but
" vim doesn't realise
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Set wrapping
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Function for deleting trailing white space.
" Taken from Stackoverflow:
" http://stackoverflow.com/questions/3474709/delete-all-spaces-and-tabs-at-the-end-of-my-lines
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

noremap <leader>w :call DeleteTrailingWS()<CR>

" Delete trailing white space upon saving files
autocmd BufWrite * :call DeleteTrailingWS()
