"
" vim-niji - Yet another rainbow parentheses plugin.
"
"  Maintainer: Appears to have disappered from the Vim scene
"

scriptencoding utf-8

if exists("g:loaded_niji")
	finish
endif
let g:loaded_niji = 1

if !exists('g:niji_matching_filetypes')
	let g:niji_matching_filetypes = ['lisp', 'scheme', 'clojure']
endif

function s:load()
	if count(g:niji_matching_filetypes, &ft) > 0
		call niji#highlight()
	endif
endfunction

augroup niji
	autocmd!
	autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * nested call s:load()
augroup END
