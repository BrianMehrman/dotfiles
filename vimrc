:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/paredit.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'sbdchd/neoformat'
Plugin 'dense-analysis/ale'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/L9'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-python/python-syntax'
Plugin 'leafgarland/typescript-vim'
" ColorScheme
Plugin 'vim-scripts/ScrollColors'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'rust-lang/rust.vim'
" Git plugin not hosted on GitHub
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype indent on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
highlight Special ctermbg=DarkMagenta
highlight Cursor ctermbg=Green

" this next line is needed to enable your custom colors:
syntax enable

set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
autocmd BufWritePre * :%s/\s\+$//e

set rtp+=/usr/local/opt/fzf
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

set grepprg=grep\ -nH\ $*

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set hls
set backspace=indent,eol,start

let g:tex_flavor='latex'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "\u2755"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_python_checkers= ['pylint', 'flake8']
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'css': ['pretier']
      \}
let g:ale_fix_on_save = 1
" Reset Leader
" nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader="  "
" ===================
" Key Bindings
" ===================

nmap <silent> <Leader><c-t> :FZF<CR>

" ===================
" Initial Vim Setup
" ==================
" Open Nerd Tree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror

" autocmd VimEnter * wincmd w
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme tesla
endif

" ===================
" BASE16 COLORs
" ===================

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ==================
" on save commands
" =================

autocmd BufWritePre,InsertLeave *.js,*jsx Neoformat

