#!/usr/bin/env bash

pane_current_command=$(tmux display -p -F "#{pane_current_command}")

if [[ "$pane_current_command" == *"vim"* ]]; then
  tmux send-keys Escape
  tmux send-keys ":Tmuxline airline" Enter
else
  tmux if-shell "test -f ~/.config/tmux/tmuxline_iceberg.snapshot" "source ~/.config/tmux/tmuxline_iceberg.snapshot" Enter
fi
