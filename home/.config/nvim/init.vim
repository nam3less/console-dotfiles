set nocompatible

" Download vim-plug if it's not there
let s:plug_autoload_path = "~/.config/nvim/autoload/plug.vim"
let s:plug_download_url  = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

" If plug isn't installed, install it
if !filereadable(expand(s:plug_autoload_path))
    silent exec "curl -fLo " . fnameescape(g:plug_autoload_path) . " --create-dirs " . g:plug_download_url
    silent exec "so " . fnameescape(g:plug_autoload_path)
endif

call plug#begin("~/.config/nvim/plugged")

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Eyecandy
Plug 'itchyny/lightline.vim'

" Fuzzy search
if executable('fzf')

    if has('mac')
        Plug '/usr/local/opt/fzf'
    else
        Plug '/usr/share/vim/vimfiles/'
    endif
    Plug 'junegunn/fzf.vim'
else
    Plug 'ctrlpvim/ctrlp.vim'
endif

" Window enhancement
" Plug 'wesQ3/vim-windowswap'

" Give me git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Make netrw awesome (at least try to)
Plug 'tpope/vim-vinegar'

" Editing candy
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
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
Plug 'pbogut/deoplete-elm'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-vim'
" Plug 'mhartington/nvim-typescript'
" Plug 'lvht/phpcd.vim', {'for': 'php', 'do': 'composer install'}
Plug 'Shougo/neco-vim'
Plug 'carlitux/deoplete-ternjs'


" Get a lot of language integration
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Get org-mode
Plug 'jceb/vim-orgmode'

" And linting
Plug 'w0rp/ale'

" REPL Integration for vim
" Plug 'metakirby5/codi.vim'
" Plug 'joonty/vdebug'

" Ruby goodness
Plug 'vim-ruby/vim-ruby'

" All in one for elixir
" Plug 'slashmili/alchemist.vim'

" Syntax theme
Plug 'morhetz/gruvbox'
Plug 'justinmk/molokai'
Plug 'arcticicestudio/nord-vim', {'branch': 'develop'}
Plug 'joshdick/onedark.vim'

call plug#end()

filetype indent plugin on
syntax on

set cursorline
set ignorecase
set hidden
set hlsearch
set list
set noruler
set noshowmode
set number
set relativenumber
set smartcase
set smartindent
set smarttab
" set termguicolors

set clipboard=unnamed
set colorcolumn=80
set cmdheight=2
set guifont=Hack:h12
set listchars=trail:·,tab:▸\ ,eol:¬
" set showtabline=2
set tabstop=4
set viminfo^=%

set shiftwidth=4
set expandtab

" Folding
set foldmethod=syntax
let php_folding = 1

" Get gruvbox to look nicer
set background=dark
let g:gruvbox_italic = 1

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20

let g:onedark_terminal_italics = 1

colorscheme nord

" Let me keep my beautiful transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Make eyecandy even more suggary
let g:airline_theme = "nord"
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

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
" call deoplete#custom#set('phpcd', 'rank', 999)

" Configure ale linters

let g:ale_linters = {
\   'php': ['php']
\}

" let g:ale_javascript_standard_executable = 'standard'
let g:ale_javascript_standard_executable = 'semistandard'

let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my-snippets"]

let g:org_agenda_files = ["~/org/General.org", "~/org/EMAF.org"]

" Ultisnips keybinds
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k'

" fzf configuration
let g:fzf_layout = { 'down': '~30%' }

let g:netrw_liststyle = 3

" Polyglot configuration
let g:polyglot_disabled = ['latex']

" Custom functions
if !exists(':BufferClean')
    command BufferClean :w | %bd | e#
endif

" set the leader character
let mapleader = " "

if !exists(':RemoveWhitespace')
    command RemoveWhitespace :%s/\s\+$//e
endif

if !exists(':W')
    command W :w
endif

if !exists(':E')
    command E :e
endif

" Because we remapped the esc-key to exit the insert mode in terminal panes,
" we have to remap it again to close the fzf buffer, if hitting esc.
autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>

" Surround block with php tags using vim surround
autocmd FileType php let b:surround_{char2nr("p")} = "<?php \r ?>"

" set the leader key for the german keyboard
" let mapleader = "ö"
" let maplocalleader = "ä"

" Set leader key for the ANSI layout
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let maplocalleader = "\\"

" Normal mode remaps
nnoremap <C-L> :nohl<CR><C-L>

" fzf command mappings
" mnemonic find
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fib :BLines<CR>
nnoremap <leader>fl :Lines<CR>

" source vimrc and edit vimrc
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

" buffer operations
nnoremap <leader>bc :BufferClean<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>l :e#<CR>

nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprevious<CR>

nnoremap <leader>cs :pclose<CR>

nmap <leader>wk <Plug>(ale_previous_wrap)
nmap <leader>wj <Plug>(ale_next_wrap)

" Terminal mode remaps
tnoremap <Esc> <C-\><C-n>

" Insert mode maps
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
