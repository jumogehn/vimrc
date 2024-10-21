let g:mapleader = ","

" It's VIM, not VI
set nocompatible

" make visual bell do nothing
set visualbell
set t_vb=

"C & C++ specific settings if any
if filereadable(expand('~/.cncpp.vimrc'))
  source ~/.cncpp.vimrc
endif

if filereadable(".project.vimrc")
  "project specific settings if any
  source .project.vimrc
else
  "A tab produces a 4-space indentation by default
  set softtabstop=4
  set tabstop=4
  set shiftwidth=4

  command! Untab :%s/\t/    /g
endif
set expandtab
set smarttab

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

"vim-plug(https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'dr-kino/cscope-maps'
if filereadable("compile_commands.json")
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()

if filereadable("compile_commands.json")
  source ~/.coc.nvimrc
endif

let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=50
let g:tagbar_left=1
let g:tagbar_width=50
let g:tagbar_sort=0

"========= key noremapping ==========

noremap <Leader>2 v]}zf
noremap <Leader>3 zo

"note for NERDTree tagbar
"https://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader

"noremap <Leader>4 :Tlist<CR><C-W><C-W>
noremap <Leader>4 :TagbarToggle<CR>
noremap <Leader>5 :NERDTreeToggle<CR>
"noremap <Leader>6 :look at the beginning
"noremap <Leader>7 :look at .cncpp.vimrc

noremap <Leader>e :E<CR>
"Netrw — Vim 파일 탐색기
"d : 새 디렉터리 생성, 이름 입력 가능
"D : 디렉터리 또는 파일 삭제, 삭제 전 확인
"R : 디렉터리 또는 파일 이름 수정

noremap <Leader>q <C-W>o<C-W>q

noremap <Leader>n <C-W>n
noremap <Leader>v <C-W>v
noremap <Leader>s <C-W>s

noremap <Leader>9 :BufExplorer<CR>

noremap <Leader>r :source ~/.vimrc<CR>

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
noremap <S-M> <C-W>4>

"The keymap below can be implemented with the help of stackoverflow and it's
"member romainl (https://stackoverflow.com/users/546861/romainl)
"https://stackoverflow.com/questions/77578019/vimscript-for-managing-windows-need-some-review
function! MoveTheWindowAllTheWayTo(direction)
  "Detect which plugins are open
  if exists('t:NERDTreeBufName')
    let l:nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
  else
    let l:nerdtree_open = 0
  endif
  let l:tagbar_open = bufwinnr('__Tagbar__') != -1

  "Close any open one
  if l:nerdtree_open
    NERDTreeClose
  endif
  if l:tagbar_open
    TagbarClose
  endif

  "Move the Window the cursor is in
  execute "wincmd " .. a:direction

  "Reopen any temporarily closed one
  if l:nerdtree_open
    NERDTree
  endif
  if l:tagbar_open
    TagbarOpen
  endif
endfunction

noremap <C-W>HH :call MoveTheWindowAllTheWayTo('H')<CR>
noremap <C-W>JJ :call MoveTheWindowAllTheWayTo('J')<CR>
noremap <C-W>KK :call MoveTheWindowAllTheWayTo('K')<CR>
noremap <C-W>LL :call MoveTheWindowAllTheWayTo('L')<CR>

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
"
"아래 4개는 오버라이딩됨
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
noremap <Leader>i :vs<CR>
noremap <Leader>- :sp<CR>

if v:version >= 500

  "============ hexViewer setting =============
  let g:hexViewer = 0
  function! Hv()
    if (g:hexViewer == 0)
      let g:hexViewer = 1
      execute "%!xxd"
    else
      let g:hexViewer = 0
      execute "%!xxd -r"
    endif
  endfunction
  noremap <Leader>h :call Hv()<CR>

  "============ file buffer CleanClose =============
  function! CleanClose(tosave)
    if (a:tosave == 1)
      w!
    endif
    let l:todelbufNr = bufnr("%")
    let l:newbufNr = bufnr("#")
    if ((l:newbufNr != -1) && (l:newbufNr != l:todelbufNr) && buflisted(l:newbufNr))
      execute "b".l:newbufNr
    else
      bnext
    endif

    if (bufnr("%") == l:todelbufNr)
      new
    endif
    execute "bd".l:todelbufNr
  endfunction

  noremap <Leader>cf :call CleanClose(0)<CR>

  "============ open CWD =============
  noremap <Leader>od :e ./<CR>

endif

