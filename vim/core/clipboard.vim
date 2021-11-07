if g:system_name ==# "Darwin"
  set clipboard=unnamed
  noremap <Leader>y "*y
  noremap <Leader>p "*p
elseif g:system_name ==# "Linux"
  set clipboard=unnamedplus
  noremap <Leader>y "+y
  noremap <Leader>p "+p
  if has('nvim')
    let g:clipboard = {
          \   'name': 'xsel_override',
          \   'copy': {
          \      '+': 'xsel --input --clipboard',
          \      '*': 'xsel --input --primary',
          \    },
          \   'paste': {
          \      '+': 'xsel --output --clipboard',
          \      '*': 'xsel --output --primary',
          \   },
          \   'cache_enabled': 1,
          \ }
  endif
endif

" Paste toggling
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
