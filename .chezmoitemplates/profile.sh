{{ if eq .os "darwin" -}}
eval "$(pyenv init --path)"
{{ else if eq .os "linux" -}}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gbai/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gbai/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/gbai/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gbai/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias vcgencmd='/opt/vc/bin/vcgencmd'

alias lc='leetcode'

export PATH="$PATH:~/scripts/commands"
{{ end -}}
