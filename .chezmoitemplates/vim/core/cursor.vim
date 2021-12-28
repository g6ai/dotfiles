{{ if eq .rtp "~/.vim" -}}
if $TERM_PROGRAM ==# 'iTerm.app'
  let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=1\x7"
  " Initialize cursor shape/color on startup
  augroup reset_iTerm_cursor_on_enter
    autocmd!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
  augroup END
else
  let &t_SI .= "\e[5 q" " SI = INSERT mode
  let &t_SR .= "\e[3 q" " SR = REPLACE mode
  let &t_EI .= "\e[1 q" " EI = NORMAL mode (ELSE)
  " Initialize cursor shape/color on startup
  augroup reset_cursor_on_enter
    autocmd!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
  augroup END
endif
" Reset cursor when Vim exits:
augroup reset_cursor_on_leave
  autocmd!
  autocmd VimLeave * silent !echo -ne "\033[5 q"
augroup END
{{ else if eq .rtp "~/.config/nvim" -}}
augroup reset_nvim_cursor
  autocmd!
  autocmd VimEnter,VimResume * set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
  autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon100
augroup END
{{ end -}}
