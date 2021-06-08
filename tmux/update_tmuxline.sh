#!/usr/bin/env bash

pane_current_command=$(tmux display -p -F "#{pane_current_command}")

if [[ "$pane_current_command" == *[V,v]im* ]]; then
  tmux send-keys Escape
  tmux send-keys ":Tmuxline airline" Enter
else
  tmux if-shell "[[ -f ~/.config/tmux/tmuxline.snapshot ]]" "source ~/.config/tmux/tmuxline.snapshot" Enter
fi
