if g:flag == "good"
  if has('nvim-0.5')
    lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
  endif
endif
