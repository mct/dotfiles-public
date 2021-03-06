" January 2003 (or sometime thereabouts), Michael C. Toren <mct@toren.net>
" Originally based on a version by Bill Jonas <bill@billjonas.com>,
" which was in turn based on gzip.vim by Bram Moolenaar <Bram@vim.org>

if has("autocmd")
augroup gnupg
  au!
  autocmd BufNewFile			*.gpg set noswapfile

  autocmd BufReadPre,FileReadPre	*.gpg set bin noswapfile
  autocmd BufReadPre,FileReadPre	*.gpg let b:ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gpg '[,']!gpg --use-agent --decrypt 2>/dev/null
  autocmd BufReadPost,FileReadPost	*.gpg set nobin
  autocmd BufReadPost,FileReadPost	*.gpg let &ch = b:ch_save|unlet b:ch_save
  autocmd BufReadPost,FileReadPost	*.gpg execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufReadPost,FileReadPost      *.gpg redraw!

  autocmd BufWritePre,FileWritePre	*.gpg normal! maHmb
  autocmd BufWritePre,FileWritePre	*.gpg set bin
  autocmd BufWritePre,FileWritePre	*.gpg '[,']!gpg --output - --armor --encrypt --no-encrypt-to --default-recipient-self
  autocmd BufWritePost,FileWritePost	*.gpg set nobin
  autocmd BufWritePost,FileWritePost	*.gpg silent undo
  autocmd BufWritePost,FileWritePost	*.gpg normal! `bzt`a
  autocmd BufReadPost,FileReadPost      *.gpg redraw!
augroup END
endif
