if has('nvim')
  lua << EOF
require("better_escape").setup {
  mapping = {"jk"}, -- a table with mappings to use
  timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  clear_empty_lines = true, -- clear line after escaping if there is only whitespace
  keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
  -- example
  -- keys = function()
  --   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
  -- end,
}
EOF
endif
