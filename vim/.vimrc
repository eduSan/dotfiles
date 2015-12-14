" edusan's .vimrc
" From a collage of tips from hundreds
" of cool people.
" ====================================
" Contents:
" I.   Plugin Manager (NeoBundle)
" II.  Plugins configuration
" 	- Unite
" 	- Syntastic
" 	- NeoSnippet
" 	- NeoComplete
" 	- Airline
" 	- Ctrl-p
" 	- JsBeautify
" III. General Options
"=====================================
			"=============================="
			"=  I. Plugin Manager Config  ="
			"=============================="
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
"=================================
" shougo's system stuff
"----------------------------
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neoyank.vim'
" Snippets and completion engines
"--------------------------------
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'davidhalter/jedi-vim'
" Interface plugins
"------------------
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ervandew/supertab'
"NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'edkolev/tmuxline.vim'
" Language stuff
"---------------
NeoBundle 'scrooloose/syntastic'
NeoBundle 'maksimr/vim-jsbeautify'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

			"========================"
			"=  II. PLUGINS CONFIG  ="
			"========================"

"-----------------------------------------------
" Unite
"-----------------------------------------------
"
" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
"-----------------------------------------------
" Syntastic
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
" Disabled, for now I'm trying out Unite.vim
"set wildignore+=*/node_modules/*,*/bower_components/*,*/env/*
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$'
"  \ }"
"-----------------------------------------------
"  JsBeautify
"-----------------------------------------------
" for js
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"
" END PLUGINS
""""""""""""""""""""""""""""""""""""

			"=========================="
			"=  III. General Options  ="
			"=========================="

set encoding=utf-8  " A life in ASCII is a life of pain
syntax on
set number
"set hidden
set softtabstop=4
set smarttab
set shiftwidth=4
set backspace=2
set mouse=a
set modeline
" Search
set hlsearch
set incsearch
" Always show statusbar
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
	" For some reason Droid Sans won't work right. Whatever...
	set guifont=Liberation\ Mono\ for\ Powerline\ 14
endif
" Treat Handlebars templates as HTML
au BufNewFile,BufRead *.handlebars set filetype=html
