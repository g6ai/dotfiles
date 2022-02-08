set hidden

" Delete the current buffer and keep the (splitted) window
nnoremap <silent> <leader>bd :bprevious! \| bdelete #<CR>

" A function to skip QuickFix buffer
function! BSkipQuickFix(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

" Move to next buffer
nnoremap <leader>bn :call BSkipQuickFix("bn!")<CR>

" Move to previous buffer
nnoremap <leader>bp :call BSkipQuickFix("bp!")<CR>
