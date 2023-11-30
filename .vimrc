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

noremap <S-H> <C-W>4<
noremap <S-J> <C-W>4-
noremap <S-K> <C-W>4+
noremap <S-L> <C-W>4>

"명령모드
"CTRL-W s :[N]sp[plit] 현재 파일을 두 개의 수평 창으로 나눔
"CTRL-W v :[N]vs[plit] 현재 파일을 두 개의 수직 창으로 나눔
"CTRL-W n :new 새로운 수평 창 생성
"CTRL-W ^ 또는 CTRL-W CTRL-^ 수평 창으로 나누고 이전 파일의 오픈
"CTRL-W f 창을 수평으로 나누고 커서 위치의 파일 오픈
"CTRL-W i 커서 위치의 단어가 정의된 파일을 오픈
"
"창삭제
"CTRL-W q :q[uit]! 현재 커서의 창을 종료
"CTRL-W c :close 현재 커서의 창 닫기
"CTRL-W o :on[ly] 현재 커서의 창만 남기고 모든 창 삭제
"
"창이동
"CTRL-W h 왼쪽 창으로 커서 이동
"CTRL-W j 아래쪽 창으로 커서 이동
"CTRL-W k 위쪽 창으로 커서 이동
"CTRL-W l 오른쪽 창으로 커서 이동
"CTRL-W w 창을 순차적으로 이동
"CTRL-W p 가장 최근에 이동한 방향으로 이동
"CTRL-W t 최상위 창으로 이동
"CTRL-W b 최하위 창으로 이동
"
"창이동
"CTRL-W r 순착으로 창의 위치를 순환
"CTRL-W x 이전 창과 위치를 바꿈
"CTRL-W H 현재창을 왼쪽 큰화면으로 이동
"CTRL-W J 현재창을 아래쪽 큰화면으로 이동
"CTRL-W K 현재창을 위쪽 큰화면으로 이동
"CTRL-W L 현재창을 오른쪽 큰화면으로 이동
"
"창 크기 조정
"
"CTRL-W =
"창의 크기를 모두 균등하게 함
"
"CTRL-W _
"수평 분할에서 창의 크기를 최대화
"
"CTRL-W |
"수직 분할에서 창의 크기를 최대화
"
"CTRL-W [N]+
":res[ize] +N
"창의 크기를 N행 만큼 증가
"
"CTRL-W [N]-
":res[ize] -N
"창의 크기를 N행 만큼 감소
"
"CTRL-W [N]>
"창의 크기를 오른쪽으로 N칸 만큼 증가
"
"CTRL-W [N]<
"창의 크기를 오른쪽으로 N칸 만큼 감소
"
"다중창 사용의 경우 대부분 붙여서 사용하는 명령어는 CTRL을 같이 눌러도 똑같은 역활을 하는 경우가 많다.
"예) CTRL-W j 는 CTRL-W CTRL-J와 같다.

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

