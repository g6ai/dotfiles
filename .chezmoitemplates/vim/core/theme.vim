{{ if eq .os "darwin" -}}
call theme#MacBackground()
{{   if eq .rtp "~/.vim" -}}
augroup MacVim_auto_background
  autocmd!
  autocmd OSAppearanceChanged * call theme#MacGUIBackground()
augroup END
{{   end -}}
{{ else -}}
call theme#Colorscheme(&background)
{{ end -}}
nmap tb :call theme#ToggleBackground()<CR>
