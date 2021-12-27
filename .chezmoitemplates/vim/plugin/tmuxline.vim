" Run :Tmuxline then :TmuxlineSnapshot! [file]
" (usually need this '!' to override)

function! TmuxlineThemeSnapshot(theme)
  execute "Tmuxline ". a:theme
  TmuxlineSnapshot! ~/.config/tmux/tmuxline.snapshot
endfunction

command! -nargs=1 TTS call TmuxlineThemeSnapshot(<f-args>)

"let airline#extensions#tmuxline#snapshot_file = "~/.tmuxline.snapshot"

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%d-%b',
      \'y'    : '%R',
      \'z'    : '#H'}

let g:tmuxline_powerline_separators = 0

augroup reset_tmuxline
  autocmd!
  autocmd VimLeave * !tmux if-shell "test -f ~/.config/tmux/tmuxline.snapshot" "source ~/.config/tmux/tmuxline.snapshot" Enter
augroup END

"augroup update_tmuxline
"  autocmd!
"  if exists('$TMUX')
"    function! UpdateTmuxlineByMode()
"      let current_mode = mode()
"      "if current_mode ==# 'i'
"      "  Tmuxline airline_insert
"      "elseif current_mode ==# 'v'
"      "  Tmuxline airline_visual
"      "elseif current_mode ==# 'V'
"      "  Tmuxline airline_visual
"      "elseif current_mode ==# "\<C-V>"
"      "  Tmuxline airline_visual
"      "else
"      "  Tmuxline airline
"      "endif
"    endfunction
"    function! UpdateTmuxlineVisualEnter()
"      set updatetime=0
"      call UpdateTmuxlineByMode()
"      return 'lh'
"    endfunction
"    function! UpdateTmuxlineVisualLeave()
"      set updatetime=4000
"      call UpdateTmuxlineByMode()
"    endfunction
"    autocmd FocusGained * call UpdateTmuxlineByMode()
"    "autocmd InsertEnter * Tmuxline airline_insert
"    "autocmd InsertLeave * Tmuxline airline
"    vnoremap <silent> <expr> <SID>UpdateTmuxlineVisualEnter UpdateTmuxlineVisualEnter()
"    nnoremap <silent> <script> v v<SID>UpdateTmuxlineVisualEnter
"    nnoremap <silent> <script> V V<SID>UpdateTmuxlineVisualEnter
"    nnoremap <silent> <script> <C-v> <C-v><SID>UpdateTmuxlineVisualEnter
"    autocmd CursorHold * call UpdateTmuxlineVisualLeave()
"  endif
"augroup END
