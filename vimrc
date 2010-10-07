" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
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
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set softtabstop=2
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
"# colorscheme default

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

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

nnoremap <CR> :noh<CR><CR>

" Google specific
syntax on 
source /usr/share/vim/google/google.vim

" The following are taken from the blog post of Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set noncompatible
set modelines=0
set encoding=utf-8
set autoindent
set cursorline
set ttyfast
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set textwidth=79
set formatoptions=qrn1
set wrap
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

set listchars=tab:▸\ ,eol:¬

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

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Save on lost focus
au FocusLost * :wa

" Strip whitespace in current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

" To fold tags (for html)
nnoremap <leader>ft Vatzf

" To sort selected properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" From David Evans
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au BufNewFile,BufRead *.txt setlocal tw=72
  au BufNewFile,BufRead *.txt setlocal spell

  au BufNewFile,BufRead *.tex setlocal tw=72
  au BufNewFile,BufRead *.tex setlocal spell
  " because I use latex-suite
  au BufNewFile,BufRead *.tex setlocal foldcolumn=5

  au BufNewFile,BufRead *.rb setlocal ts=4 sw=4
  au BufNewFile,BufRead *.cpp setlocal ts=4 sw=4
  au BufNewFile,BufRead *.c setlocal ts=4 sw=4
endif
