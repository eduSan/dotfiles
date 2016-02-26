" edusan's .vimrc
" From a collage of tips from hundreds
" of cool people.
" ====================================
" Contents:
" I.   Plugin Manager (Vim-Plug)
" II.  Plugins configuration
" 	- NeoMake -----------------Syntastic
"       - YouCompleteMe
" 	- UltiSnips
" 	- Airline
"       - NERDTree
"       - Tagbar
" 	- Ctrl-p
" 	- JsBeautify
" 	- Slimux
" 	- IndentGuides
"       - RainbowParenthesis
" III. IDE-style Options
" IV.  General Options
"=====================================
                        "=============================="
                        "=  I. Plugin Manager Config  ="
                        "=============================="
"Plug Scripts-----------------------------
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
"
" Snippets and completion engines
"--------------------------------
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} " Ti generate YCM project config
Plug 'ternjs/tern_for_vim'
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'ervandew/supertab'
" Interface plugins
"------------------
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-rooter'  " Auto-change directory to project root

Plug 'epeli/slimux'
" Language stuff
"---------------
Plug 'benekastah/neomake'
" Plug 'scrooloose/syntastic'
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'

" Colors and stuff
"-----------------
Plug 'flazz/vim-colorschemes'


call plug#end()

filetype plugin indent on

"End Plug Scripts-------------------------

" remap leader key before config
let mapleader = ','

                        "========================"
                        "=  II. PLUGINS CONFIG  ="
                        "========================"
"-----------------------------------------------
" NeoMake ----- Syntastic
"-----------------------------------------------
autocmd! BufWritePost * Neomake
let g:neomake_java_enabled_makers = []  " No maker for Java, I have eclim
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"" C/C++
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_cpp_compiler_options = '-std=c++11'
"" TypeScript
"let g:syntastic_typescript_tsc_fname = ''
"-----------------------------------------------
"  YouCompleteMe
"-----------------------------------------------
let g:ycm_global_ycm_extra_conf="$HOME/.config/nvim/.ycm_extra_conf.py"
let g:EclimCompletionMethod = 'omnifunc' " For Eclim support
"-----------------------------------------------
"  UltiSnips
"-----------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"-----------------------------------------------
"  Airline
"-----------------------------------------------
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"-----------------------------------------------
"  NERDTree
"-----------------------------------------------
nnoremap <leader>s :NERDTreeToggle<cr>
"-----------------------------------------------
"  Tagbar
"-----------------------------------------------
nnoremap <leader>k :TagbarToggle<cr>
"-----------------------------------------------
"  Ctrl-p
"-----------------------------------------------
" Ignore node, bower, virtualenv
set wildignore+=*/node_modules/*,*/bower_components/*,*/env/*,*/jspm_packages/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }"
nnoremap <leader>y :CtrlPYankring<cr>
"-----------------------------------------------
"  JsBeautify
"-----------------------------------------------
" for js
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"-----------------------------------------------
"  Slimux
"-----------------------------------------------
" Slime-style bindings
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
"-----------------------------------------------
"  IndentGuides
"-----------------------------------------------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
"-----------------------------------------------
"  RainbowParenthesis
"-----------------------------------------------
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"
"
" END PLUGINS
""""""""""""""""""""""""""""""""""""

                    "============================"
                    "=  III. IDE-style Options  ="
                    "============================"
:set completeopt=longest,menuone        " insert longest common match; menu will come up even if there's only one match
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"      " Select completion with ENTER

" Keep writing while selecting completion
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Remove common longest text
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"
" END IDE
""""""""""""""""""""""""""""""""""""
                    "=========================="
                    "=  IV. General Options   ="
                    "=========================="

set encoding=utf-8  " A life in ASCII is a life of pain
syntax on
set number
"set hidden
set softtabstop=4
set smarttab
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set mouse=a
set modeline
" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
" Niceties
set laststatus=2 " Always show statusbar
set wildmenu " Nicer tab completion in command mode
set relativenumber " nice for numbered commands
set showcmd
set scrolloff=3

" Line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1j
"set colorcolumn=81

" Show whitespace
" set list
" set listchars=tab:▸\ ,eol:¬

" Sane people's split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Colors!
let &t_Co=256
" Enable yank/delete with the X11 clipboard
set clipboard=unnamedplus
"
" Folding
set foldmethod=indent " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
"
" Set color theme for gvim
if has('gui_running')
    set background=dark
    colorscheme solarized
    set guifont=Hack\ Regular\ 12
endif
" Treat Handlebars templates as HTML
au BufNewFile,BufRead *.handlebars set filetype=html
