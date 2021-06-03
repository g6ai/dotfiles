#!/usr/bin/env bash

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" | \
while read pane_process
do
  IFS=' ' read -ra pane_process <<< "$pane_process"
  if [[ "${pane_process[1]}" == *"vim"* ]]; then
    tmux send-keys -t ${pane_process[0]} Escape
    tmux send-keys -t ${pane_process[0]} ":Tmuxline airline" Enter
  else
    tmux source ~/.config/tmux/tmuxline_iceberg.snapshot
  fi
done
