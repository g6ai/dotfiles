# Start of profile.sh
{{ if eq .os "darwin" -}}
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
{{ else if eq .os "linux" -}}
alias vcgencmd='/opt/vc/bin/vcgencmd'
alias lc='leetcode'

export PATH="$PATH:~/scripts/commands"
{{ end -}}
# End of profile.sh

