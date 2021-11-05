if g:flag == "good"
  if !has('nvim-0.5')
    let g:Lf_ShortcutF = "<leader>ff"
    let g:Lf_ShortcutB = "<leader>fb"
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = {'left': "\ue0b0", 'right': "\ue0b2"}
    let g:Lf_ShowDevIcons = 1
  endif
endif
