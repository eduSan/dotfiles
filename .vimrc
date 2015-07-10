set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins"
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

" Completion
Plugin 'Valloric/YouCompleteMe'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

" Syntax/Language Plugins
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'othree/html5.vim'
Plugin 'jplaut/vim-arduino-ino' "Arduino

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
" PLUGINS CONFIG
"
" Syntastic
let g:syntastic_cpp_check_header = 1
" Command-T
set wildignore=node_modules,bower_components

"
" END PLUGINS
"

" Misc general options
syntax on
set number
set tabstop=4
set shiftwidth=4
set backspace=2
set mouse=a
set modeline
set hlsearch

" Stuff for gvim
if has('gui_running')
	set background=dark
	colorscheme solarized
	set guifont=Droid\ Sans\ Mono\ 12
endif

" Treat Handlebars templates as HTML
au BufNewFile,BufRead *.handlebars set filetype=html
