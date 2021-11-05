if g:flag == "good"
  inoremap <C-s> <C-\><C-o>:Leaderf snippet<CR>
  let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})
  let g:Lf_PreviewResult.snippet = 1
endif
