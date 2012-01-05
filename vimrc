" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
syntax on 
filetype plugin indent on         " Turn on file type detection.


runtime macros/matchit.vim        " Load the matchit plugin.

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

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set softtabstop=2
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove 

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax shiftwidth=2 tabstop=2
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

nnoremap <CR> :noh<CR><CR>


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

set textwidth=79
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

" Save on lost focus
au FocusLost * :wa

" Strip whitespace in current file
nnoremap <leader>W :%s/\s\+$//e<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

" To fold tags (for html)
nnoremap <leader>ft Vatzf

" From David Evans
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au BufNewFile,BufRead *.txt setlocal tw=72
  au BufNewFile,BufRead *.txt setlocal spell

  au BufNewFile,BufRead *.tex setlocal tw=72
  au BufNewFile,BufRead *.tex setlocal spell
  " because I use latex-suite
  au BufNewFile,BufRead *.tex setlocal foldcolumn=5

  au BufNewFile,BufRead *.rb setlocal ts=2 sw=2
  au BufNewFile,BufRead *.erl setlocal ts=2 sw=2
  au BufNewFile,BufRead *.cpp setlocal ts=4 sw=4
  au BufNewFile,BufRead *.c setlocal ts=4 sw=4
endif

imap jj <Esc>

" Toggling between showing an hiding invisible characters
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:·
set listchars+=nbsp:—
set listchars+=,extends:#,precedes:#

"Invisible character colors
highlight NonText guifg=#A9A9A9
highlight SpecialKey guifg=#A9A9A9

set formatprg=par\ -rjeq

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
" Remember that I can use z= to get suggestions

" Increase the default font size
" set guifont="Menlo\ 13"

" My own little refactoring mapping for inlining a varialbe
nnoremap <leader>inl ^mq*``f=wv$hh"wy``dw"wPV=`qdd

" colorscheme topfunky-light
" colorscheme eclm_wombat
" Solazired coluor scheme
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

let g:erl_author="Sebastian Probst Eide"
let g:erl_company="Kleio"
