" Add ghc-mod to PATH
let $PATH .= ":" . $HOME . "/.cabal/bin"
" Enable YCM semantic trigger on .
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc
