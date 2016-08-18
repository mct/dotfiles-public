" vim:set ts=4 sw=4 ai et smarttab:

set nocompatible
function IsReply()
	if line('$') > 1
		silent :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
		silent :%s/^>*\zs\s\+$//e
	endif
	setlocal tw=75
    setlocal fo=tcqw
    setlocal noai
    setlocal nosmartindent
    setlocal noshowmatch
    setlocal nobackup
    setlocal ruler
    setlocal ic
    setlocal bs=2
    setlocal modelines=0
endfunction

"autocmd FileType mail setlocal tw=75 noai nosmartindent noshowmatch nobackup ruler ic bs=2 modelines=0 term=screen
autocmd FileType mail call IsReply()

syntax on

"set tw=78		" autowrap the text to 78 characters
"set ai			" autoindenting on
"set si			" smartindenting (?)
"set sw=5		" shift width, for << and >>
"set ts=5		" tab stop; how many spaces is a tab
"set vb			" use a visual bell, instead of the anoying beep

set sh=/bin/bash
set nobackup		" dont do backups
set ruler		" turn on the ruler
set ignorecase		" ignore case
set smartcase		" search case-sensitive if something is uppercase
set bs=2		" allow backspacing over everything in insert mode
set showmatch		" show matching bracket when entered
set nohls		" Don't highlight all of the maches when searching
set nocindent		" I don't like magic c indenting
set matchpairs=(:),{:},[:],<:>
set noea	" Don't always equalize windows
set joinspaces
set showcmd

" When do we display a status line?
" 0 -- Never
" 1 -- Only with multiple windows
" 2 -- Always
set laststatus=2

" Disable the command 'K' (keyword lookup) by mapping it an empty command.
"map K :<CR>
set keywordprg=dict "\ -P-
"set keywordprg=git\ show "\ -P-

" With Vim-4 the format command was just 'Q' and
" I am too used to it, so I need this back!
nnoremap Q gq
vnoremap Q gq

" GUI Stuff
set guifont=-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-1
set guifont=Courier " 10 Pitch 14
set guicursor=n-v-c-o:block-Cursor,ve:ver35-Cursor,i-r-ci-cr:ver25-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guioptions=agimrT

" For when I edit my TODO file.
"augroup mct-todo
"  au!
"  autocmd BufRead TODO set sw=4
"  autocmd BufRead TODO map <tab> :echo foo<cr>
"augroup END

" make gf act like ^wf
" mct, Mon Nov  5 14:12:44 EST 2001
"map gf <c-w>f<c-w>_
map gf :new <cfile><CR><C-w>_
"map gf :new <cfile><CR>

" add "@-@" to isfname, for use with gf
set isfname=@,@-@,48-57,/,.,-,_,+,,,#,$,%,~,=

" needs some work
" autocmd BufEnter * cd %:p:h

"au BufReadPost *.c    syn region myFold start="{" end="}" transparent fold
"au BufReadPost *.c    syn sync fromstart
"au BufReadPost *.c    set foldmethod=syntax
"set foldlevel=0

" Flip the mappings of C-t and C-], so that they make much more sense to me
"noremap <c-]>	<c-t>
"noremap <c-t>	<c-]>

" Avoid loading the highlighting matching parens stuff
:let loaded_matchparen = 1
"DoMatchParen

" Bind "gt" to execute the "journal today" function
function! Journal()
  execute "new" strftime("~/todo/gtd/.calendar-data/%Y-%m")
  silent! execute "normal! /" . strftime("%B *%e") . "\<CR>"
  execute "normal zz"
endfunction
noremap gt :call Journal()<cr>

"augroup mct-cvs-commit-view-diff
"  au!
"  autocmd syntax cvs silent! new
"  autocmd syntax cvs silent! read !cvs diff 
"  autocmd syntax cvs silent! execute "normal! /Index\<CR>"
"  autocmd syntax cvs silent! execute "normal! z\<CR>"
"  autocmd syntax cvs set syntax=diff nomod
"  autocmd syntax cvs wincmd w
"augroup END
"
"augroup mct-svn-commit-view-diff
"  au!
"  autocmd syntax svn silent! execute "normal! G"
"  autocmd syntax svn silent! read !svn diff 
"  autocmd syntax svn silent! execute "normal! 1G"
"  autocmd syntax cvs set syntax=diff
"augroup END

" From :help last-position-jump
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" python
autocmd FileType python setlocal ts=4 sw=4 ai expandtab smarttab softtabstop=4

" Go
autocmd FileType go setlocal ts=4 sw=4 ai expandtab smarttab softtabstop=4 syntax=go
autocmd BufNewFile,BufReadPost *.go set filetype=go

" Arduino
"autocmd BufNewFile,BufReadPost *.pde set filetype=c
"autocmd BufNewFile,BufReadPost *.ino set filetype=c

" c++, for utorrent.  Ideally, I'd only want this going off for *.{cpp,h,cpp} with "utorrent/" in their path
autocmd FileType cpp setlocal ts=4 sw=4 ai nocindent

" for working with opentracker
"autocmd FileType c setlocal ts=2 sw=2 ai expandtab smarttab softtabstop=2

" avoid enabling syntax in "*.s" files, from multilog, which vim thinks are assembly files
"autocmd FileType asm set syntax=none

"noremap gh :nohlsearch<CR>
"noremap gH :set invhls<CR>
noremap gh :set hls!<c-m>

set nohls

"hmm, need work to make this right
"map :ntag :new<CR>:tag

" http://items.sjbach.com/319/configuring-vim-right
let mapleader = ","
set history=1000

" Better tab expansion
"set wildmenu
set wildmode=longest,list

" set term=ansi

map gl          :set background=light<c-m>
map gd          :set background=dark<c-m>

" if has(house)
" set mouse=a
" endif
" http://stackoverflow.com/questions/8939043/gnu-screen-and-vim-adjusting-the-split-window-buffer-size-with-mouse
"set ttymouse=xterm2

" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"set incsearch

"""" http://vim.wikia.com/wiki/VimTip1454  from the bottom
""function! GetProtoLine()
""  let ret       = ""
""  let line_save = line(".")
""  let col_save  = col(".")
""  let window_line = winline()
""  let top       = line_save - winline() + 1
""  let so_save = &so
""  let &so = 0
""  let istypedef = 0
""  " find closing brace
""  let closing_lnum = search('^}','cW')
""  if closing_lnum > 0
""    if getline(line(".")) =~ '\w\s*;\s*$'
""      let istypedef = 1
""      let closingline = getline(".")
""    endif
""    " go to the opening brace
""    keepjumps normal! %
""    " if the start position is between the two braces
""    if line(".") <= line_save
""      if istypedef
""        let ret = matchstr(closingline, '\w\+\s*;')
""      else
""        " find a line contains function name
""        let lnum = search('^\w','bcnW')
""        if lnum > 0
""          let ret = getline(lnum)
""        endif
""      endif
""      let lines = closing_lnum - line(".")
""      let line_rel = line_save - line(".")
""      let ret = ret . ':' . line_rel . '/' . lines
""    endif
""  endif
""  "exe "keepjumps normal! " . top . "Gz\<CR>"
""  " restore position and screen line
""  call cursor(line_save, col_save)
""  " needed for diff mode (scroll fixing)
""  let line_diff = winline() - window_line
""  if line_diff > 0
""    exe 'normal ' . line_diff . "\<c-e>"
""  elseif line_diff < 0
""    exe 'normal ' . -line_diff . "\<c-y>"
""  endif
""  " sometimes cursor position is wrong after scroll fix, why? Workaround:
""  call cursor(line_save, col_save)
""  let &so = so_save
""  return ret
""endfunction
""
""function! WhatFunction()
""  " allow to quickly disable it (:let b:noWhatFunction=1)
""  if exists("b:noWhatFunction") && b:noWhatFunction
""    return ""
""  endif
""  if &ft != "c" && &ft != "cpp"
""    return ""
""  endif
""  let proto = GetProtoLine()
""  if proto == ""
""    return "?"
""  endif
""  let line_info = matchstr(proto, ':\d\+\/\d\+')
""  if stridx(proto, '(') > 0
""    let ret = matchstr(proto, '\~\?\w\+(\@=')
""  elseif proto =~# '\<struct\>'
""    let ret = matchstr(proto, 'struct\s\+\w\+')
""  elseif proto =~# '\<class\>'
""    let ret = matchstr(proto, 'class\s\+\w\+')
""  else
""    let ret = strpart(proto, 0, 15) . "..."
""  endif
""  let ret .= line_info
""  return ret
""endfunction
""
""
""
""""" http://vim.wikia.com/wiki/VimTip1296
""function! WhatFunctionAreWeIn()
""  let strList = ["while", "foreach", "ifelse", "if else", "for", "if", "else", "try", "catch", "case"]
""  let foundcontrol = 1
""  let position = ""
""  let pos=getpos(".")          " This saves the cursor position
""  let view=winsaveview()       " This saves the window view
""  while (foundcontrol)
""    let foundcontrol = 0
""    normal [{
""    call search('\S','bW')
""    let tempchar = getline(".")[col(".") - 1]
""    if (match(tempchar, ")") >=0 )
""      normal %
""      call search('\S','bW')
""    endif
""    let tempstring = getline(".")
""    for item in strList
""      if( match(tempstring,item) >= 0 )
""        let position = item . " - " . position
""        let foundcontrol = 1
""        break
""      endif
""    endfor
""    if(foundcontrol == 0)
""      call cursor(pos)
""      call winrestview(view)
""      return tempstring.position
""    endif
""  endwhile
""  call cursor(pos)
""  call winrestview(view)
""  return tempstring.position
""endfunction


""" http://vim.wikia.com/wiki/VimTip1267
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
"map f :call ShowFuncName() <CR>
map ,f :call ShowFuncName() <CR>

set ic
set viminfo=!,'20,<50,s10,h " was:   viminfo='100,<50,s10,h

" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

:inoremap <Nul> <C-p>

"execute pathogen#infect()

syntax on

" help sign
" foldtext

" https://gist.github.com/sjl/3360978
function! SomeFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=SomeFoldText()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://coderwall.com/p/usd_cw
"if has("folding")
"  set foldenable        " enable folding
"  set foldmethod=syntax " fold based on syntax highlighting
"  set foldlevelstart=99 " start editing with all folds open
"
"  " toggle folds
"  nnoremap <Space> za
"  vnoremap <Space> za
"
"  set foldtext=FoldText()
"  function! FoldText()
"    let l:lpadding = &fdc
"    redir => l:signs
"      execute 'silent sign place buffer='.bufnr('%')
"    redir End
"    let l:lpadding += l:signs =~ 'id=' ? 2 : 0
"
"    if exists("+relativenumber")
"      if (&number)
"        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
"      elseif (&relativenumber)
"        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
"      endif
"    else
"      if (&number)
"        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
"      endif
"    endif
"
"    " expand tabs
"    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
"    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')
"
"    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
"    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
"    let l:width = winwidth(0) - l:lpadding - l:infolen
"
"    let l:separator = ' … '
"    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
"    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
"    let l:text = l:start . ' … ' . l:end
"
"    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
"  endfunction
"endif


" http://fhoerni.free.fr/comp/vim.html
":function! FoldTextIndent()
":  let line = getline(v:foldstart)
":  let i = 1
":  let r = ""
":  while i < v:foldlevel
":    let r = r . "  "
":    let i = i + 1
":  endwhile
":  return r . line
":endfunction
":set foldtext=FoldTextIndent()

"filetype plugin indent on

set nofsync swapsync=

map gs  :.!strike <c-m>
vmap gs :!strike <c-m>
map g-  :s/^/∙ /<c-m>
map g_  :.!underline <c-m>
vmap g_ :!underline <c-m>
"set undofile	" an experiment. http://vimdoc.sourceforge.net/htmldoc/undo.html#undo-persistence

" help cmdnline.txt
"cmapclear
cnoremap <C-a>            <Home>
cnoremap <C-e>            <End>
cnoremap <C-b>            <Left>
cnoremap <C-f>            <Right>
cnoremap <C-d>            <Del>
cnoremap <Esc>b           <S-Left>
cnoremap <Esc>f           <S-Right>
cnoremap <Esc><Backspace> <C-w>
" missing: <C-k>
" help fixdel

source ~/.vim/vimrc-background
