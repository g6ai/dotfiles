" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" kitty config window needs node path to be set
" when invoked by cmd+comma
{{ if eq .chezmoi.os "darwin" -}}
  let g:coc_node_path = '/opt/homebrew/bin/node'

{{ else if eq .chezmoi.os "linux" -}}
  let g:coc_node_path = '/usr/bin/node'

{{ end -}}

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Install extensions
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-sh', '@yaegassy/coc-pylsp', 'coc-vimtex']
