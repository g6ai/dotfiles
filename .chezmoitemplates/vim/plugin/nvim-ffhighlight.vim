lua << EOF
vim.cmd([[
  hi default fFHintChar ctermfg=red cterm=bold guifg=red gui=bold
  hi default fFHintNumber ctermfg=red cterm=bold guifg=red gui=bold
  hi default fFHintWords cterm=underline gui=underline
  hi default link fFHintCurrentWord fFHintWords
  hi default fFPromptSign ctermfg=red cterm=bold guifg=red gui=bold
]])
require('fFHighlight').setup()
EOF
