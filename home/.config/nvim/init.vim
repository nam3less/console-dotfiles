set nocompatible

" Download vim-plug if it's not there
let g:plug_autoload_path = "~/.config/nvim/autoload/plug.vim"
let g:plug_download_url  = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

" If plug isn't installed, install it
if !filereadable(expand(g:plug_autoload_path))
    silent exec "curl -fLo " . fnameescape(g:plug_autoload_path) . " --create-dirs " . g:plug_download_url
    silent exec "so " . fnameescape(g:plug_autoload_path)
endif


call plug#begin("~/.config/nvim/plugged")

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Eyecandy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy search
if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
else
    Plug 'ctrlpvim/ctrlp.vim'
endif

" Make netrw awesome (at least try to)
Plug 'tpope/vim-vinegar'

" Editing candy
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" PLEASE let me type less
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'algotech/ultisnips-php'

" Autocompletion providers for deoplete
Plug 'pbogut/deoplete-elm'
Plug 'php-vim/phpcd.vim'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-vim'
Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs'

" Get a lot of language integration
Plug 'sheerun/vim-polyglot'
" And linting
Plug 'w0rp/ale'

" REPL Integration for vim
Plug 'metakirby5/codi.vim'

" All in one for elixir
Plug 'slashmili/alchemist.vim'

" Syntax theme
Plug 'morhetz/gruvbox'

call plug#end()

filetype indent plugin on
syntax on

set cursorline
set hidden
set hlsearch
set list
set noruler
set noshowmode
set number
set relativenumber
set smarttab
set termguicolors

set clipboard=unnamed
set cmdheight=2
set guifont=Hack:h11
set listchars=trail:·,tab:▸\ ,eol:¬
set tabstop=4
set viminfo^=%

" Colorize vim nicely
colorscheme gruvbox
" Get gruvbox to look nicer
set background=dark
let g:gruvbox_contrast_dark = "hard"

" Let me keep my beautiful transparent background
hi Normal guibg=NONE ctermbg=NONE

" Make eyecandy even more suggary
let g:airline_powerline_fonts = 1
let g:airline_theme = "minimalist"

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ":t"

let g:fzf_layout = { 'down': '~40%' }


" set the leader character
let mapleader = "ö"

" Normal mode remaps
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-p> :Files<CR>

" fzf command mappings
" mnemonic find
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>

" source vimrc and edit vimrc
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

" buffer operations
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bl :e#<CR>
