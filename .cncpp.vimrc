" VIMRC for C & C++

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

if v:version >= 703
  " Highlight characters over the 80 columns.
  let g:hitog = 0
  set cc=
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

  " Highlight trailing whitespace.
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

set cinoptions=:0,g0,(0,Ws,l1

" Highlight syntax in programming languages
syntax on

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's needed to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

"" Enable syntax highlighting for reStructuredText files. To use, copy
"" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
"" to ~/.vim/syntax .
"augroup filetype
" au! BufRead,BufNewFile *.rst     set filetype=rest
"augroup END

" function definition is supported only after version 5 of vim
if v:version >= 500

  "========= cscope setting ========
  "cscope related are sourced from a plugin below :
  "$HOME/.vim/bundle/cscope-maps/plugin/cscope_maps.vim
  set cscopequickfix=s-,c-,d-,i-,t-,e-

  let g:quickfixtog = 0
  function! OpenQuickFixWindow()
    if (g:quickfixtog == 0)
      let g:quickfixtog = 1
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
      execute "cw"
      "Reopen any temporarily closed one
      if l:nerdtree_open
        NERDTree
      endif
      if l:tagbar_open
        TagbarOpen
      endif
    else
      let g:quickfixtog = 0
      "Move the Window the cursor is in
      execute "ccl"
    endif
  endfunction
  noremap <Leader>cw :call OpenQuickFixWindow()<CR>

  function! Cnext()
    execute "cn"
  endfunction
  noremap <Leader>cn :call Cnext()<CR>

  function! Cprevious()
    execute "cp"
  endfunction
  noremap <Leader>cp :call Cprevious()<CR>

"========= ctags setting ========
"Upon vim open a file buffer, CWD is switched to the position of the current
"file
"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/

"set tags=./tags;/.

  "tag select [ident]
  function! Ts()
    let wd = expand("<cword>")
    execute "ts ".wd
  endfunction
  noremap <Leader>ts :call Ts()<CR>

  "split + tag select [ident]
  function! Sts()
    let wd = expand("<cword>")
    execute "sts ".wd
  endfunction
  noremap <Leader>st :call Sts()<CR>

"tag stack
  "tag stack previous(pop)
  function! Tsp()
    execute "po"
  endfunction
  noremap <Leader>tsp :call Tsp()<CR>

  "tag stack next
  function! Tsn()
    execute "ta"
  endfunction
  noremap <Leader>tsn :call Tsn()<CR>

"tag list
  "tag jump
  function! Tj()
    let wd = expand("<cword>")
    execute "tj ".wd
  endfunction
  noremap <Leader>tj :call Tj()<CR>

  "tag next
  function! Tn()
    execute "tn"
  endfunction
  noremap <Leader>tn :call Tn()<CR>

  "tag previous
  function! Tp()
    execute "tp"
  endfunction
  noremap <Leader>tp :call Tp()<CR>

  "tag rewind
  function! Tr()
    execute "tr"
  endfunction
  noremap <Leader>tr :call Tr()<CR>

  "tag first
  function! Tf()
    execute "tf"
  endfunction
  noremap <Leader>tf :call Tf()<CR>

  "tag last
  function! Tl()
    execute "tl"
  endfunction
  noremap <Leader>tl :call Tl()<CR>

  "============ man page setting =============
  function! Man()
    let wd = expand("<cword>")
    execute "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".wd
  endfunction
  noremap <Leader>ma :call Man()<CR><CR>

  "============ make setting =============
  let startdir = getcwd()
  function! Make()
    execute "!cd ".startdir
    execute "make"
  endfunction
  noremap <Leader>mk :call Make()<CR><CR>

  "============ clean make setting =============
  function! CleanMake()
    execute "!cd ".startdir
    execute "make clean"
    execute "make"
  endfunction
  noremap <Leader>cmk :call CleanMake()<CR><CR>

endif
