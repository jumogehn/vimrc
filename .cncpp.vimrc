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
  noremap <Leader>7 :call Ht()<CR>
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
  function! Ts()
    let wd = expand("<cword>")
    exe "ts ".wd
  endfunction
  noremap <Leader>ts :call Ts()<CR>

  "split + tag select [ident]
  function! Sts()
    let wd = expand("<cword>")
    exe "sts ".wd
  endfunction
  noremap <Leader>st :call Sts()<CR>

"tag stack
  "tag stack previous(pop)
  function! Tsp()
    exe "po"
  endfunction
  noremap <Leader>tsp :call Tsp()<CR>

  "tag stack next
  function! Tsn()
    exe "ta"
  endfunction
  noremap <Leader>tsn :call Tsn()<CR>

"tag list
  "tag jump
  function! Tj()
    let wd = expand("<cword>")
    exe "tj ".wd
  endfunction
  noremap <Leader>tj :call Tj()<CR>

  "tag next
  function! Tn()
    exe "tn"
  endfunction
  noremap <Leader>tn :call Tn()<CR>

  "tag previous
  function! Tp()
    exe "tp"
  endfunction
  noremap <Leader>tp :call Tp()<CR>

  "tag rewind
  function! Tr()
    exe "tr"
  endfunction
  noremap <Leader>tr :call Tr()<CR>

  "tag first
  function! Tf()
    exe "tf"
  endfunction
  noremap <Leader>tf :call Tf()<CR>

  "tag last
  function! Tl()
    exe "tl"
  endfunction
  noremap <Leader>tl :call Tl()<CR>

endif

"======== cscope setting ========
"set csprg=/usr/bin/cscope
set csto=0
set cst

if version >= 500

  function! Cw()
    exe "cs show"
  endfunction
  noremap <Leader>cw :call Cw()<CR>

  function! Cc()
    let wd = expand("<cword>")
    new
    exe "cs find c ".wd
  endfunction
  noremap <Leader>cc :call Cc()<CR>

  function! Cd()
    let wd = expand("<cword>")
    new
    exe "cs find d ".wd
  endfunction
  noremap <Leader>cd :call Cd()<CR>

  function! Ce()
    let wd = expand("<cword>")
    new
    exe "cs find e ".wd
  endfunction
  noremap <Leader>ce :call Ce()<CR>

  function! Cf()
    let wd = expand("<cword>")
    new
    exe "cs find f ".wd
  endfunction
  noremap <Leader>cf :call Cf()<CR>

  function! Cg()
    let wd = expand("<cword>")
    new
    exe "cs find g ".wd
  endfunction
  noremap <Leader>cg :call Cg()<CR>

  function! Ci()
    let wd = expand("<cword>")
    new
    exe "cs find i ".wd
  endfunction
  noremap <Leader>ci :call Ci()<CR>

  function! Cs()
    let wd = expand("<cword>")
    new
    exe "cs find s ".wd
  endfunction
  noremap <Leader>cs :call Cs()<CR>

  function! Ct()
    let wd = expand("<cword>")
    new
    exe "cs find t ".wd
  endfunction
  noremap <Leader>ct :call Ct()<CR>


  function! Ccv()
    let wd = expand("<cword>")
    vnew
    exe "cs find c ".wd
  endfunction
  noremap <Leader>ccv :call Ccv()<CR>

  function! Cdv()
    let wd = expand("<cword>")
    vnew
    exe "cs find d ".wd
  endfunction
  noremap <Leader>cdv :call Cdv()<CR>

  function! Cev()
    let wd = expand("<cword>")
    vnew
    exe "cs find e ".wd
  endfunction
  noremap <Leader>cev :call Cev()<CR>

  function! Cfv()
    let wd = expand("<cword>")
    vnew
    exe "cs find f ".wd
  endfunction
  noremap <Leader>cfv :call Cfv()<CR>

  function! Cgv()
    let wd = expand("<cword>")
    vnew
    exe "cs find g ".wd
  endfunction
  noremap <Leader>cgv :call Cgv()<CR>

  function! Civ()
    let wd = expand("<cword>")
    vnew
    exe "cs find i ".wd
  endfunction
  noremap <Leader>civ :call Civ()<CR>

  function! Csv()
    let wd = expand("<cword>")
    vnew
    exe "cs find s ".wd
  endfunction
  noremap <Leader>csv :call Csv()<CR>

  function! Ctv()
    let wd = expand("<cword>")
    vnew
    exe "cs find t ".wd
  endfunction
  noremap <Leader>ctv :call Ctv()<CR>

endif

if filereadable("cscope.out")
  set nocsverb
  cs add cscope.out
  set csverb
endif


if version >= 500

  "============ man page setting =============
  function! Man()
    let wd = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".wd
  endfunction
  noremap <Leader>ma :call Man()<CR><CR>

  "============ make setting =============
  let startdir = getcwd()
  function! Make()
    exe "!cd ".startdir
    exe "make"
  endfunction
  noremap <Leader>mk :call Make()<CR><CR>

  "============ clean make setting =============
  function! CleanMake()
    exe "!cd ".startdir
    exe "make clean"
    exe "make"
  endfunction
  noremap <Leader>cmk :call CleanMake()<CR><CR>

endif

