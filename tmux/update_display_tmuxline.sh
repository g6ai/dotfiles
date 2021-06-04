#!/usr/bin/env bash

DISPLAY=$(tmux show-env | sed -n 's/^DISPLAY=//p')

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" \
  | while read pane_line
    do
      IFS=' ' read -ra pane_fields <<< "$pane_line"
      if [[ "${pane_fields[1]}" == "bash" ]]; then
        tmux send-keys -t ${pane_fields[0]} "export DISPLAY=$DISPLAY" Enter
      elif [[ "${pane_fields[1]}" == *"vim"* ]]; then
        tmux send-keys -t ${pane_fields[0]} Escape
        tmux send-keys -t ${pane_fields[0]} ":let \$DISPLAY = \"$DISPLAY\"" Enter
        #tmux send-keys -t ${pane_fields[0]} ":xrestore" Enter
      fi
    done

tmux run-shell ~/.config/tmux/update_tmuxline.sh
