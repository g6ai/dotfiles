set hidden

" Delete the current buffer and keep the (splitted) window
nnoremap <silent> <leader>bd :bprevious! \| bdelete #<CR>

function! SkipQuickFixBuffer(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

nnoremap <silent> gb :call SkipQuickFixBuffer("bnext!")<CR>
nnoremap <silent> gB :call SkipQuickFixBuffer("bprevious!")<CR>

augroup delete_certain_buffer_in_only_window
" This overrides the nvim-bqf behaviour slightly
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "qf" | bdelete | endif
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" | bdelete | endif
augroup END
