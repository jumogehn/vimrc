let mapleader = ","
"============ sourcing vimrc for C & C++ =============
source ~/.cncpp.vimrc

"System and Project specific vimrcs are being sourced at the bottom

"============ now general vimrc begins =============
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
noremap <Leader>6 :set invpaste paste?<CR>

set pastetoggle=<Leader>6
set showmode
set fencs=ucs-bom,utf-8,cp949,euc-kr
set bg=dark
set ruler
set number
set modifiable
set hlsearch
set mouse=c
set incsearch
set ignorecase
set smartcase
set printoptions=portrait:y,wrap:y,duplex:off

"========= vundle setting =========
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'taglist.vim'
Plugin 'bufexplorer.zip'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
"Plugin 'tpope/vim-fugitive'

"Plugin 'snipMate'
"Plugin 'L9'
"Plugin 'FuzzyFinder'
"Plugin 'DirDiff.vim'
"Plugin 'rmartinho/vim-cpp11'
"Plugin 'XDebug-DBGp-client-for-PHP'

call vundle#end()

filetype plugin indent on     " required!

let NERDTreeWinPos='right'
let g:NERDTreeWinSize=50
let g:tagbar_left=1
let g:tagbar_width=50

"========= key noremapping ==========

noremap <Leader>2 v]}zf
noremap <Leader>3 zo

"noremap <Leader>4 :Tlist<CR><C-W><C-W>
noremap <Leader>4 :TagbarToggle<CR>
noremap <Leader>5 :NERDTreeToggle<CR>
"noremap <Leader>6 :look at the beginning
"noremap <Leader>7 :look at .cncpp.vimrc

noremap <Leader>9 :BufExplorer<cr>

noremap <PageUp> <C-U><C-U>
noremap <PageDown> <C-D><C-D>

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

noremap <S-H> <C-W><<C-W><<C-W><<C-W><
noremap <S-J> <C-W>-<C-W>-<C-W>-<C-W>-
noremap <S-K> <C-W>+<C-W>+<C-W>+<C-W>+
noremap <S-L> <C-W>><C-W>><C-W>><C-W>>

"========= switch between file buffers ========
noremap <Leader>x :bn!<CR>	  " Switch to Next File Buffer
noremap <Leader>z :bp!<CR>	  " Switch to Previous File Buffer
noremap <Leader>w :bw<CR>	  " Close Current File Buffer

"========= split ========
noremap <Leader>i :vs<cr>
noremap <Leader>- :sp<cr>

if version >= 500

  "============ hexViewer setting =============
  let g:hexViewer = 0
  function! Hv()
    if (g:hexViewer == 0)
      let g:hexViewer = 1
      exe "%!xxd"
    else
      let g:hexViewer = 0
      exe "%!xxd -r"
    endif
  endfunction
  noremap <Leader>h :call Hv()<cr>

  "============ file buffer CleanClose =============
  function! CleanClose(tosave)
    if (a:tosave == 1)
      w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
      exe "b".newbufNr
    else
      bnext
    endif

    if (bufnr("%") == todelbufNr)
      new
    endif
    exe "bd".todelbufNr
  endfunction

  noremap <Leader>cf :call CleanClose(0)<cr>

  "============ open CWD =============
  noremap <Leader>od :e ./<cr>

endif

"============ system specific settings if any =============
"Make sure c++ include path in included in this.
if filereadable(expand('~/.system.vimrc')) "need for c/c++ include path setting
  source ~/.system.vimrc
endif

"============ project specific settings if any =============
if filereadable(".project.vimrc") "this is an option
  source .project.vimrc
endif

