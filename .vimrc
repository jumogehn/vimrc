"============ sourcing LLVM vimrc =============
source ~/.llvm.vimrc       " this is a must!
                           " Journeyer's vimrc is dependent on llvm's

"============ now Journeyer's vimrc begins =============
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F6> :set invpaste paste?<CR>
set pastetoggle=<F6>
set showmode
set fencs=ucs-bom,utf-8,cp949,euc-kr

"set nowrap
"set ff=unix  "you can set dos or mac for line ending
"http://vim.wikia.com/wiki/File_format
"set showcmd
"set showmatch
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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'snipMate'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'DirDiff.vim'
Bundle 'rmartinho/vim-cpp11'
" Bundle 'clang-complete'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

let NERDTreeWinPos='right'

"========= key mapping ==========

map <F2> v]}zf
map <F3> zo

map <F4> :Tlist<cr><C-W><C-W>
map <F5> :NERDTreeToggle<CR>
"   <F6> See above there is the pastetoggle

let g:hitog = 0
function! Ht() "Highlight toggle
  if (g:hitog == 0)
    let g:hitog = 1
    execute ("highlight LongLine ctermbg=8")
  else
    let g:hitog = 0
    execute ("highlight LongLine ctermbg=DarkYellow guibg=DarkYellow")
  endif
endfunction
map <F7> :call Ht()<cr>

map <F9> :BufExplorer<cr>

map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

nmap <C-Left> <C-W><<C-W><<C-W><<C-W><
nmap <S-Left> <C-W><

nmap <C-Right> <C-W>><C-W>><C-W>><C-W>>
nmap <S-Right> <C-W>>
nmap <A-Right> <C-W>\|

nmap <C-Up> <C-W>+<C-W>+<C-W>+<C-W>+
nmap <S-Up> <C-W>+
nmap <A-Up> <C-W>_

nmap <C-Down> <C-W>-<C-W>-<C-W>-<C-W>-
nmap <S-Down> <C-W>-

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0


"========= ctags setting ========
"Upon vim open a file buffer, CWD is switched to the position of the current
"file
"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/

"set tags=./tags;/.

" function definition is supported only after version 5 of vim
if version >= 500

  func! Sts()
    let st = expand("<cword>")
    exe "sts ".st
  endfunc
  nmap ,st :call Sts()<cr>

  func! Tj()
    let st = expand("<cword>")
    exe "tj ".st
  endfunc
  nmap ,tj :call Tj()<cr>

  func! Tn()
    exe "tn"
  endfunc
  nmap ,tn :call Tn()<cr>

  func! Tp()
    exe "tp"
  endfunc
  nmap ,tp :call Tp()<cr>

  func! Tr()
    exe "tr"
  endfunc
  nmap ,tr :call Tr()<cr>

  func! Tl()
    exe "tl"
  endfunc
  nmap ,tl :call Tl()<cr>

endif

"======== cscope setting ========
"set csprg=/usr/bin/cscope
set csto=0
set cst

if version >= 500

  func! Csw()
    exe "cs show"
  endfunc
  nmap ,csw :call Csw()<cr>

  func! Csc()
    let csc = expand("<cword>")
    new
    exe "cs find c ".csc
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,csc :call Csc()<cr>

  func! Csd()
    let csd = expand("<cword>")
    new
    exe "cs find d ".csd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,csd :call Csd()<cr>

  func! Cse()
    let cse = expand("<cword>")
    new
    exe "cs find e ".cse
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,cse :call Cse()<cr>

  func! Csf()
    let csf = expand("<cword>")
    new
    exe "cs find f ".csf
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,csf :call Csf()<cr>

  func! Csg()
    let csg = expand("<cword>")
    new
    exe "cs find g ".csg
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,csg :call Csg()<cr>

  func! Csi()
    let csi = expand("<cword>")
    new
    exe "cs find i ".csi
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,csi :call Csi()<cr>

  func! Css()
    let css = expand("<cword>")
    new
    exe "cs find s ".css
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,css :call Css()<cr>

  func! Cst()
    let cst = expand("<cword>")
    new
    exe "cs find t ".cst
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  nmap ,cst :call Cst()<cr>

endif

if filereadable("cscope.out")
  set nocsverb
  cs add cscope.out
  set csverb
endif



if version >= 500

  "============ man page setting =============
  func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
  endfunc
  nmap ,ma :call Man()<cr><cr>

  "============ make setting =============
  let startdir = getcwd()
  func! Make()
    exe "!cd ".startdir
    exe "make"
  endfunc
  nmap ,mk :call Make()<cr><cr>

  "============ clean make setting =============
  func! CleanMake()
    exe "!cd ".startdir
    exe "make clean"
    exe "make"
  endfunc
  nmap ,cmk :call CleanMake()<cr><cr>

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
if filereadable(expand('~/.system.vimrc')) "need for c++ include path setting
  source ~/.system.vimrc
endif

"============ project specific settings if any =============
if filereadable(".project.vimrc") "this is an option
  source .project.vimrc
endif

