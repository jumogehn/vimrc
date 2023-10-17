"============ sourcing vimrc for C & C++ =============
source ~/.cncpp.vimrc

"System and Project specific vimrcs are being sourced at the bottom

"============ now general vimrc begins =============
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nmap ,6 :set invpaste paste?<CR>

set pastetoggle=,6
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
let g:tagbar_left = 1
let g:tagbar_width = 30

"========= key mapping ==========

nmap ,2 v]}zf
nmap ,3 zo

"nmap ,4 :Tlist<CR><C-W><C-W>
nmap ,4 :TagbarToggle<CR>
nmap ,5 :NERDTreeToggle<CR>
"nmap ,6 :look at the beginning
"nmap ,7 :look at .cncpp.vimrc

nmap ,9 :BufExplorer<cr>

map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <S-H> <C-W><<C-W><<C-W><<C-W><
nmap <S-J> <C-W>-<C-W>-<C-W>-<C-W>-
nmap <S-K> <C-W>+<C-W>+<C-W>+<C-W>+
nmap <S-L> <C-W>><C-W>><C-W>><C-W>>

"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer


if version >= 500

  "============ hexViewer setting =============
  let g:hexViewer = 0
  func! Hv()
    if (g:hexViewer == 0)
      let g:hexViewer = 1
      exe "%!xxd"
    else
      let g:hexViewer = 0
      exe "%!xxd -r"
    endif
  endfunc
  nmap ,h :call Hv()<cr>

  "============ file buffer CleanClose =============
  func! CleanClose(tosave)
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
  endfunc

  nmap ,cf :call CleanClose(0)<cr>

  "============ open CWD =============
  nmap ,od :e ./<cr>

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

