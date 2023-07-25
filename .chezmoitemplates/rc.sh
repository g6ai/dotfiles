if [[ "$(uname)" == "Linux" ]]; then
  if ! command -v nvim &> /dev/null; then
    export EDITOR=/usr/bin/vim
    export MANPAGER='less -s -M +Gg'
  else
    # If Neovim is installed with package manager:
    export EDITOR=/usr/bin/nvim
    # If Neovim is installed from source:
    #export EDITOR=/usr/local/bin/nvim
    export MANPAGER='nvim +Man!'
  fi
elif [[ "$(uname)" == "Darwin" ]]; then
  if ! command -v nvim &> /dev/null; then
    export EDITOR=/opt/homebrew/bin/vim
    export MANPAGER='less -s -M +Gg'
  else
    export EDITOR=/opt/homebrew/bin/nvim
    export MANPAGER='nvim +Man!'
  fi
fi
export VISUAL="$EDITOR"

alias sudo='sudo '
alias la='ls -A'
alias ll='ls -ltAh'
alias pd='pushd'
alias pdw='pushd .'
alias po='popd'
alias gst='git status'
alias glg='git log --all --graph --decorate'
if command -v nvim &> /dev/null; then
  alias vi='nvim'
else
  alias vi='vim'
fi
alias kk='kitty +kitten'
alias magit='emacsclient -n -e "(magit-status)"'
alias ta='tmux attach-session'
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'

# Clear screen
cls () {
  if [[ "$TERM" == "tmux-256color" && -n "TMUX" ]]; then
    clear && tmux clear-history 
  else
    # This is equivalent to clear && printf '\e[3J'
    printf '\33c\e[3J'
  fi
}

# Terminal color
export CLICOLOR=1
export COLORTERM=truecolor
#export LSCOLORS=GxFxCxDxBxegedabagaced
if [[ "$(uname)" == "Darwin" ]]; then
  # If using native BSD utils
  #alias ls='ls -G'
  # If installed "coreutils" with homebrew,
  # and added
  # export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  # to ~/.bashrc_local per advice after installation
  alias ls='ls --color=auto'
elif [[ "$(uname)" == "Linux" ]]; then
  alias ls='ls --color=auto'
fi

# If $LESS is unset, Git sets it to FRX. I don't want F or X.
export LESS='R'

# less colour
export LESS_TERMCAP_so=$(tput bold; tput setaf 6)  # enter standout mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)     # leave standout mode
export LESS_TERMCAP_mb=$(tput blink; tput setaf 1) # enter blinking mode
export LESS_TERMCAP_md=$(tput bold; tput setaf 3)  # enter double-bright mode
export LESS_TERMCAP_me=$(tput sgr0)                # turn off all appearance modes
export LESS_TERMCAP_us=$(tput sitm; tput setaf 2)  # turn on underline mode
export LESS_TERMCAP_ue=$(tput ritm; tput sgr0)     # turn off underline mode
# and so on

{{ if eq .os "darwin" -}}
alias cafe="caffeinate -disu &"
alias bup="brew update && brew upgrade"
alias lacie="smartctl -a disk3 | grep Temperature"
alias yd="noglob ~/scripts/youtube-dl/yd"
alias cm="chezmoi"

# Add N/Vim spellfiles and snippets to .chezmoitemplates
cm_add_vim () {
  cp ~/.vim/spell/en.utf-8.add ~/.local/share/chezmoi/.chezmoitemplates/vim/spell
  cp ~/.vim/spell/tex.utf-8.add ~/.local/share/chezmoi/.chezmoitemplates/vim/spell
  cp ~/.vim/UltiSnips/tex.snippets ~/.local/share/chezmoi/.chezmoitemplates/vim/UltiSnips
}
cm_add_nvim () {
  cp ~/.config/nvim/spell/en.utf-8.add ~/.local/share/chezmoi/.chezmoitemplates/vim/spell
  cp ~/.config/nvim/spell/tex.utf-8.add ~/.local/share/chezmoi/.chezmoitemplates/vim/spell
  cp ~/.config/nvim/UltiSnips/tex.snippets ~/.local/share/chezmoi/.chezmoitemplates/vim/UltiSnips
}

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/jpeg-turbo/bin:$PATH"

eval "$(pyenv init - --no-rehash)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_HOOK_PATH="$HOME/.config/pyenv.d"

eval "$(pyenv virtualenv-init -)"

export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if [ -n "$BASH_VERSION" ]; then
  eval "$(thefuck --alias)"
fi

export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="/Library/TeX/Distributions/Programs/texbin:$PATH"

export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"

{{ else if eq .os "linux" -}}
alias cm="$HOME/bin/chezmoi"

{{ end -}}
