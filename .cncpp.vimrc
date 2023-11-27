" VIMRC for C & C++
" from LLVM coding guidelines conformance for VIM

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
if v:version >= 703
  let g:hitog = 1
  set cc=81
  function! Ht() "Highlight toggle
    if (g:hitog == 0)
      let g:hitog = 1
      set cc=81
    else
      let g:hitog = 0
      set cc=
    endif
  endfunction
  noremap <Leader>7 :call Ht()<cr>
  highlight ColorColumn ctermbg=DarkYellow guibg=DarkYellow
  " Whitespace at the end of a line. This little dance suppresses
  " whitespace that has just been typed.
  " Disable if this is too heavy
  highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
  au InsertEnter * call matchdelete(w:m1)
  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
  au InsertLeave * call matchdelete(w:m2)
  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
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

  "tag select [ident]
  func! Ts()
    let wd = expand("<cword>")
    exe "ts ".wd
  endfunc
  noremap <Leader>ts :call Ts()<cr>

  "split + tag select [ident]
  func! Sts()
    let wd = expand("<cword>")
    exe "sts ".wd
  endfunc
  noremap <Leader>st :call Sts()<cr>

"tag stack
  "tag stack previous(pop)
  func! Tsp()
    exe "po"
  endfunc
  noremap <Leader>tsp :call Tsp()<cr>

  "tag stack next
  func! Tsn()
    exe "ta"
  endfunc
  noremap <Leader>tsn :call Tsn()<cr>

"tag list
  "tag jump
  func! Tj()
    let wd = expand("<cword>")
    exe "tj ".wd
  endfunc
  noremap <Leader>tj :call Tj()<cr>

  "tag next
  func! Tn()
    exe "tn"
  endfunc
  noremap <Leader>tn :call Tn()<cr>

  "tag previous
  func! Tp()
    exe "tp"
  endfunc
  noremap <Leader>tp :call Tp()<cr>

  "tag rewind
  func! Tr()
    exe "tr"
  endfunc
  noremap <Leader>tr :call Tr()<cr>

  "tag first
  func! Tf()
    exe "tf"
  endfunc
  noremap <Leader>tf :call Tf()<cr>

  "tag last
  func! Tl()
    exe "tl"
  endfunc
  noremap <Leader>tl :call Tl()<cr>

endif

"======== cscope setting ========
"set csprg=/usr/bin/cscope
set csto=0
set cst

if version >= 500

  func! Cw()
    exe "cs show"
  endfunc
  noremap <Leader>cw :call Cw()<cr>

  func! Cc()
    let wd = expand("<cword>")
    new
    exe "cs find c ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cc :call Cc()<cr>

  func! Cd()
    let wd = expand("<cword>")
    new
    exe "cs find d ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cd :call Cd()<cr>

  func! Ce()
    let wd = expand("<cword>")
    new
    exe "cs find e ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>ce :call Ce()<cr>

  func! Cf()
    let wd = expand("<cword>")
    new
    exe "cs find f ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cf :call Cf()<cr>

  func! Cg()
    let wd = expand("<cword>")
    new
    exe "cs find g ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cg :call Cg()<cr>

  func! Ci()
    let wd = expand("<cword>")
    new
    exe "cs find i ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>ci :call Ci()<cr>

  func! Cs()
    let wd = expand("<cword>")
    new
    exe "cs find s ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cs :call Cs()<cr>

  func! Ct()
    let wd = expand("<cword>")
    new
    exe "cs find t ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>ct :call Ct()<cr>


  func! Ccv()
    let wd = expand("<cword>")
    vnew
    exe "cs find c ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>ccv :call Ccv()<cr>

  func! Cdv()
    let wd = expand("<cword>")
    vnew
    exe "cs find d ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cdv :call Cdv()<cr>

  func! Cev()
    let wd = expand("<cword>")
    vnew
    exe "cs find e ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cev :call Cev()<cr>

  func! Cfv()
    let wd = expand("<cword>")
    vnew
    exe "cs find f ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cfv :call Cfv()<cr>

  func! Cgv()
    let wd = expand("<cword>")
    vnew
    exe "cs find g ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>cgv :call Cgv()<cr>

  func! Civ()
    let wd = expand("<cword>")
    vnew
    exe "cs find i ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>civ :call Civ()<cr>

  func! Csv()
    let wd = expand("<cword>")
    vnew
    exe "cs find s ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>csv :call Csv()<cr>

  func! Ctv()
    let wd = expand("<cword>")
    vnew
    exe "cs find t ".wd
    if getline(1) == " "
      exe "q!"
    endif
  endfunc
  noremap <Leader>ctv :call Ctv()<cr>

endif

if filereadable("cscope.out")
  set nocsverb
  cs add cscope.out
  set csverb
endif


if version >= 500

  "============ man page setting =============
  func! Man()
    let wd = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".wd
  endfunc
  noremap <Leader>ma :call Man()<cr><cr>

  "============ make setting =============
  let startdir = getcwd()
  func! Make()
    exe "!cd ".startdir
    exe "make"
  endfunc
  noremap <Leader>mk :call Make()<cr><cr>

  "============ clean make setting =============
  func! CleanMake()
    exe "!cd ".startdir
    exe "make clean"
    exe "make"
  endfunc
  noremap <Leader>cmk :call CleanMake()<cr><cr>

endif

