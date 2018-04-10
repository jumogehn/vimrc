" LLVM coding guidelines conformance for VIM
" $Revision: 176235 $
"
" Maintainer: The LLVM Team, http://llvm.org
" WARNING:    Read before you source in all these commands and macros!  Some
"             of them may change VIM behavior that you depend on.
"
" You can run VIM with these settings without changing your current setup with:
" $ vim -u /path/to/llvm/utils/vim/vimrc

" It's VIM, not VI
set nocompatible

" A tab produces a 2-space indentation
"if filereadable(expand('~/.cshrc')) "Indentation to 4 spaces
"set softtabstop=4
"set tabstop=4
"set shiftwidth=4
"else
set softtabstop=2
set shiftwidth=2
"endif
set expandtab

" Highlight trailing whitespace and lines longer than 80 columns.
"Indentation to 4 spaces
if 1
  "Testing of ignoring highlight to see if this causes slow down
else
highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
if v:version >= 702
  " Lines longer than 80 columns.
  au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

  " Whitespace at the end of a line. This little dance suppresses
  " whitespace that has just been typed.
  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
  au InsertEnter * call matchdelete(w:m1)
  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
  au InsertLeave * call matchdelete(w:m2)
  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
else
  au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
  au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
  au InsertLeave * syntax match WhitespaceEOL /\s\+$/
endif
endif

" Enable filetype detection
filetype on

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END
" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1
" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" Highlight syntax in programming languages
syntax on

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
"if filereadable(expand('~/.cshrc')) "Tab to 4 spaces
"command! Untab :%s/\t/    /g
"else
command! Untab :%s/\t/  /g
"endif

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
 au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END



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

endif

