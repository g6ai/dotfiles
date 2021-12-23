let mapleader = " "
let maplocalleader = " "

" Load local .vimrc files
set exrc
set secure

if !exists("*ReloadConfigs")
  function ReloadConfigs()
    :source ~/.vim/vimrc
    if has('gui_running')
      if !has('gui_vimr')
        :source ~/.vim/gvimrc
      else
        :source ~/.config/nvim/ginit.vim
      endif
    endif
  endfunction
  command! RC call ReloadConfigs()
endif

packadd chezmoi.vim

