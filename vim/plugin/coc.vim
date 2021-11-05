if g:flag == "good"
  " Remap <CR> to make sure it confirms completion when popup menu is visible
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " kitty config window needs node path to be set
  " when invoked by cmd+comma
  if g:system_name ==# "Darwin"
    let g:coc_node_path = '/usr/local/bin/node'
  elseif g:system_name ==# "Linux"
    let g:coc_node_path = '/usr/bin/node'
  endif

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')
endif
