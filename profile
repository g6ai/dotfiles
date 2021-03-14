if [[ "$(uname)" == "Linux" ]]; then
    export EDITOR=/usr/bin/vim
fi

alias sudo='sudo '
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -ltAh'
alias pd='pushd'
alias pdw='pushd .'
alias po='popd'
alias vi='vim'

# Source local settings
PROFILE_LOCAL=~/.profile_local
if [[ -f "$PROFILE_LOCAL" ]]; then
    source $PROFILE_LOCAL
fi
