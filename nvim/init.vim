" edusan's .vimrc
" From a collage of tips from hundreds
" of cool people.
" ====================================
" Contents:
" I.   Plugin Manager (Vim-Plug)
" II.  Plugins configuration
" 	- NeoMake -----------------Syntastic
"       - YouCompleteMe
"       - Deoplete
" 	- UltiSnips
" 	- Airline
"       - NERDTree
"       - LocalVimrc
"       - Tagbar
" 	- Ctrl-p
" 	- JsBeautify
" 	- Slimux
" 	- IndentGuides
"       - RainbowParenthesis
"       - MemoList
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

" Main completion, YCM or deoplete

" YCM  + conf generator
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} " Ti generate YCM project config
" Plug 'Valloric/YouCompleteMe'

" Shougo/deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Disable supertab with YCM
Plug 'ervandew/supertab'

" Not sure if tern/jedi plugins are needed with ycm
" Plug 'ternjs/tern_for_vim'
" Plug 'davidhalter/jedi-vim'

" Completion sources
Plug 'zchee/libclang-python3'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-jedi'
Plug 'ternjs/tern_for_vim'      " Also provides :Tern* commands
Plug 'carlitux/deoplete-ternjs'
Plug 'mhartington/deoplete-typescript'
Plug 'landaire/deoplete-swift'
Plug 'racer-rust/vim-racer'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dag/vim-fish'

" Deoplete plugins
Plug 'Shougo/neoinclude.vim'

" Interface plugins
"------------------
Plug 'tpope/vim-fugitive'               " git
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'              " folder tree nav
Plug 'bling/vim-airline'                " Cool statusline
Plug 'majutsushi/tagbar'                " Navigate by function/class
Plug 'nathanaelkane/vim-indent-guides'  " Show indentation
Plug 'luochen1990/rainbow'              " Match parens by color

" File finder et al.
Plug 'ctrlpvim/ctrlp.vim'             " fuzzy file finder
Plug 'sgur/ctrlp-extensions.vim'      " alternative to Unite
" Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdcommenter'         " Toggle comment like a boss
Plug 'tpope/vim-surround'               " Magic powers
Plug 'tpope/vim-repeat'                 " enable . repeat for plugins
Plug 'Raimondi/delimitMate'             " Autoclose stuff

Plug 'wincent/ferret'                   " Search with ack/ag

" Tmux & friends
"---------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'
Plug 'epeli/slimux'

" Linters && syntax checkers
"----------------------------
Plug 'benekastah/neomake'               " Async! wow!
" Plug 'scrooloose/syntastic'

" Language stuff
"---------------
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rust-lang/rust.vim'

" Project management
"-------------------
Plug 'airblade/vim-rooter'      " Auto-change directory to project root
Plug 'embear/vim-localvimrc'    " load .vimrc from project root

" Other
"-------
Plug 'chriskempson/base16-vim'  " Colors!
Plug 'glidenote/memolist.vim'   " Nice memo functionality for vim
Plug 'wincent/loupe'            " File-search tweaks

call plug#end()

filetype plugin indent on       " Enable filetype detection

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
let g:neomake_cpp_enabled_makers = []  " No maker for cpp, I have YCM

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
" TypeScript
"let g:syntastic_typescript_tsc_fname = ''
"-----------------------------------------------
"  YouCompleteMe
"-----------------------------------------------
let g:ycm_always_populate_location_list = 1  " Yay :lopen
let g:ycm_global_ycm_extra_conf="$HOME/.config/nvim/.ycm_extra_conf.py"
let g:EclimCompletionMethod = 'omnifunc' " For Eclim support
"-----------------------------------------------
"  Deoplete
"-----------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

" Use deoplete.
let g:tern_request_timeout = 1
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
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
"  LocalVimrc
"-----------------------------------------------
let g:localvimrc_persistence_file = $HOME.'/.config/nvim/localvimrc_persistent'
let g:localvimrc_persistent = 1
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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --ignore-dir .git --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" extensions
let g:ctrlp_extensions = ['tag', 'quickfix', 'rtscript',
                        \ 'undo', 'line', 'changes', 'autoignore']


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
"-----------------------------------------------
"  MemoList
"-----------------------------------------------
" Memo dir path
let g:memolist_path = $HOME.'/Dropbox/memo'
" suffix type (default markdown)
let g:memolist_memo_suffix = 'markdown' " markdown | txt
" tags prompt (default 0)
let g:memolist_prompt_tags = 0
" categories prompt (default 0)
let g:memolist_prompt_categories = 0
" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 0
" use various Ex commands (default '')
let g:memolist_ex_cmd = 'CtrlP'
"
" END PLUGINS
""""""""""""""""""""""""""""""""""""

                    "============================"
                    "=  III. IDE-style Options  ="
                    "============================"
":set completeopt=longest,menuone        " insert longest common match; menu will come up even if there's only one match
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
set laststatus=2    " Always show statusbar
set wildmenu        " Nicer tab completion in command mode
"set relativenumber " handy for numbered commands
set showcmd
set scrolloff=3

" Line wrapping
set wrap
set textwidth=80
set formatoptions=qrn1j
set colorcolumn=81

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
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

" Colors and fonts
set background=dark
" Set color theme for gvim
if has('gui_running')
    set guifont=Source\ Code \Pro\ Light\ 13
    colorscheme base16-ocean
endif
