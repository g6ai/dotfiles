augroup wilder_init
  autocmd!
  autocmd CmdlineEnter * ++once call s:wilder_init()
augroup END

function! s:wilder_init() abort
  call wilder#setup({
        \ 'modes': [':', '/', '?'],
        \ })

  call wilder#set_option('renderer', wilder#renderer_mux({
{{- if eq .rtp "~/.config/nvim" }}
        \ ':': wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
        \   'border': 'rounded',
        \   'highlights': {
        \     'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
        \     'border': 'Normal',
        \     'default': 'Normal',
        \   },
{{- else if eq .rtp "~/.vim" }}
        \ ':': wilder#popupmenu_renderer({
        \   'highlights': {
        \     'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
        \   },
{{- end }}
        \   'left': [
        \     ' ', wilder#popupmenu_devicons(),
        \   ],
        \   'right': [
        \     ' ', wilder#popupmenu_scrollbar(),
        \   ],
        \   'highlighter': wilder#basic_highlighter(),
{{- if eq .rtp "~/.config/nvim" }}
        \   'pumblend': 20,
        \ })),
{{- else if eq .rtp "~/.vim" }}
        \ }),
{{- end }}
        \ '/': wilder#wildmenu_renderer({
        \   'highlighter': wilder#basic_highlighter(),
        \ }),
        \ }))
endfunction
