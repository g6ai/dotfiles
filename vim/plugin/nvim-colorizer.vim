if g:flag == "good"
  if $TERM_PROGRAM !=# 'Apple_Terminal' && has('nvim')
    lua require'colorizer'.setup()
  endif
endif
