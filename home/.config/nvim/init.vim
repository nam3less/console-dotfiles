set nocompatible

" Download vim-plug if it's not there
let g:plug_autoload_path = "~/.config/nvim/autoload/plug.vim"
let g:plug_download_url  = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

" If plug isn't installed, install it
if !filereadable(expand(g:plug_autoload_path))
    silent exec "!curl -fLo " . fnameescape(g:plug_autoload_path) . " --create-dirs " . g:plug_download_url
    silent exec "so " . fnameescape(g:plug_autoload_path)
endif


call plug#begin("~/.config/nvim/plugged")

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Eyecandy
Plug 'itchyny/lightline.vim'

" Fuzzy search
if executable('fzf')
    Plug '/usr/share/vim/vimfiles/'
    Plug 'junegunn/fzf.vim'
else
    Plug 'ctrlpvim/ctrlp.vim'
endif

" Make netrw awesome (at least try to)
Plug 'tpope/vim-vinegar'

" Editing candy
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'

" PLEASE let me type less
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'algotech/ultisnips-php'
Plug 'dhruvasagar/vim-table-mode'

" Autocompletion providers for deoplete
" Plug 'pbogut/deoplete-elm'
" Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-vim'
" Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs'


" Get a lot of language integration
Plug 'sheerun/vim-polyglot'
" And linting
Plug 'w0rp/ale'

" REPL Integration for vim
Plug 'metakirby5/codi.vim'

" Ruby goodness
Plug 'vim-ruby/vim-ruby'

" All in one for elixir
Plug 'slashmili/alchemist.vim'

" Syntax theme
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

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
set smartindent
set smarttab
" set termguicolors

set clipboard=unnamed
set cmdheight=2
set guifont=Hack:h11
set listchars=trail:·,tab:▸\ ,eol:¬
set showtabline=2
set tabstop=4
set viminfo^=%

set foldmethod=syntax
let php_folding=1

" Get gruvbox to look nicer
set background=dark
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1


" Colorize vim nicely
colorscheme gruvbox

" Let me keep my beautiful transparent background
hi Normal guibg=NONE ctermbg=NONE

let g:lightline = {
    \ 'colorscheme' : 'tender',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" Ultisnips keybinds
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k'

" ftf config
let g:fzf_layout = { 'down': '~40%' }

" Custom function
if !exists(':BufferClean')
    command BufferClean :w | %bd | e#
endif

" set the leader character
let mapleader = " "

" Normal mode remaps
nnoremap <C-L> :nohl<CR><C-L>

" fzf command mappings
" mnemonic find
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>

" source vimrc and edit vimrc
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

" buffer operations
nnoremap <leader>bc :BufferClean<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>l :e#<CR>

" jump to new lint error
nnoremap <leader>wj <Plug>(ale_next_wrap)
nnoremap <leader>wk <Plug>(ale_previous_wrap)

" Insert mode maps
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "<S-TAB>"

