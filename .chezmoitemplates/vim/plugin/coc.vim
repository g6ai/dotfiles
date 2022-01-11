" Remap <CR> to make sure it confirms completion when popup menu is visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" kitty config window needs node path to be set
" when invoked by cmd+comma
{{ if eq .chezmoi.os "darwin" -}}
  let g:coc_node_path = '/run/current-system/sw/bin/node'

{{ else if eq .chezmoi.os "linux" -}}
  let g:coc_node_path = '/usr/bin/node'

{{ end -}}

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
