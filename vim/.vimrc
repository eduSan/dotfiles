			"========================="
			"  Plugin Manager Config  "
			"========================="
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/edusan/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/edusan/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'christoomey/vim-tmux-navigator'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

			"=================="
			"  PLUGINS CONFIG  "
			"=================="

" Syntastic "
"-----------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1
"-----------------------------------------------
"  NeoSnippet
"-----------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"-----------------------------------------------
"  NeoComplete
"-----------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
execute "source " '/home/edusan/.vim/.neocomprc'
let g:neocomplete#enable_at_startup = 1
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
"  Ctrl-p
"-----------------------------------------------
set wildignore+=*/node_modules/*,*/bower_components/*,*/env/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }"
"-----------------------------------------------
"  JsBeautify
"-----------------------------------------------
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"
" END PLUGINS
""""""""""""""""""""""""""""""""""""

			"==================="
			"  General Options  "
			"==================="

set encoding=utf-8  " A life in ASCII is a life of pain
syntax on
set number
set hidden
set tabstop=4
set shiftwidth=4
set backspace=2
set mouse=a
set modeline
set hlsearch
set laststatus=2
" Sane people's split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Colors!
let &t_Co=256
" Enable yank/delete with the X11 clipboard
set clipboard=unnamedplus
" Set color theme for gvim
if has('gui_running')
	set background=dark
	colorscheme solarized
	set guifont=Droid\ Sans\ Mono\ 12
endif
" Treat Handlebars templates as HTML
au BufNewFile,BufRead *.handlebars set filetype=html
