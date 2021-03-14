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

# Terminal color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [[ "$(uname)" == "Darwin" ]]; then
    # If using native BSD utils
    #alias ls='ls -G'
    # If installed "coreutils" with homebrew,
    # and added
    # export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    # to ~/.bashrc_local per advice after installation
    alias ls='ls --color'
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls='ls --color'
fi

# less color
export LESS=-R+Gg
export LESS_TERMCAP_mb=$'\E[01;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[01;33m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;35m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[01;04;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

# Source local settings
PROFILE_LOCAL=~/.profile_local
if [[ -f "$PROFILE_LOCAL" ]]; then
    source $PROFILE_LOCAL
fi
