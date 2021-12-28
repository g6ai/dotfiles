{{ if eq .rtp "~/.vim" -}}
{{   if eq .os "darwin" -}}
if has('python3_dynamic')
  "set pythonhome=$HOME/.pyenv/versions/2.7.18
  "set pythondll=$HOME/.pyenv/versions/2.7.18/lib/libpython2.7.dylib
  "set pythonthreehome=$HOME/.pyenv/versions/3.8.10
  "set pythonthreedll=$HOME/.pyenv/versions/3.8.10/lib/libpython3.8.dylib
  py3 1+2
  pyx 1+2
endif
{{   end -}}
{{ else if eq .rtp "~/.config/nvim" -}}
{{   if eq .os "darwin" -}}
let g:python_host_prog = '$HOME/.pyenv/versions/py2nvim/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'
{{   else if eq .os "linux" -}}
let g:python3_host_prog = '$HOME/miniforge3/envs/py3nvim/bin/python'
endif
{{   end -}}
{{ end -}}
