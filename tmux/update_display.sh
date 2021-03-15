#!/usr/bin/env bash

DISPLAY=$(tmux show-env | sed -n 's/^DISPLAY=//p')

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" | \
while read pane_process
do
  IFS=' ' read -ra pane_process <<< "$pane_process"
  if [[ "${pane_process[1]}" == "bash" ]]; then
    tmux send-keys -t ${pane_process[0]} "export DISPLAY=$DISPLAY" Enter
  elif [[ "${pane_process[1]}" == *"vim"* ]]; then
    tmux send-keys -t ${pane_process[0]} Escape
    tmux send-keys -t ${pane_process[0]} ":let \$DISPLAY = \"$DISPLAY\"" Enter
    tmux send-keys -t ${pane_process[0]} ":xrestore" Enter
  fi
done
