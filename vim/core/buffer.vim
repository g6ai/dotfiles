" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bd :bp! \| bd #<CR>

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
