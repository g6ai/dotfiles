augroup wilder_init
  autocmd!
  autocmd CmdlineEnter * ++once call s:wilder_init()
augroup END

function! s:wilder_init() abort
  call wilder#setup({
        \ 'modes': [':', '/', '?'],
        \ })

  call wilder#set_option('renderer', wilder#renderer_mux({
        \ ':': wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
        \   'border': 'rounded',
        \   'highlights': {
        \     'border': 'Normal',
        \   },
        \   'highlighter': wilder#basic_highlighter(),
        \   'left': [
        \     ' ', wilder#popupmenu_devicons(),
        \   ],
        \   'right': [
        \     ' ', wilder#popupmenu_scrollbar(),
        \   ],
{{- if eq .rtp "~/.config/nvim" }}
        \   'pumblend': 20,
{{- end }}
        \ })),
        \ '/': wilder#wildmenu_renderer({
        \   'highlighter': wilder#basic_highlighter(),
        \ }),
        \ }))
endfunction
