{{ if eq .os "darwin" -}}
set clipboard=unnamed
noremap <Leader>y "*y
noremap <Leader>p "*p

{{ else if eq .os "linux" -}}
set clipboard=unnamedplus
noremap <Leader>y "+y
noremap <Leader>p "+p

{{   if eq .rtp "~/.config/nvim" -}}
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

{{   end -}}
{{ end -}}

" Paste toggling
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
