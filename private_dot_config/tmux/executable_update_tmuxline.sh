#!/usr/bin/env bash

tmux if-shell "[[ $(defaults read -g AppleInterfaceStyle) = Dark ]]" \
  "source ~/.config/tmux/tmuxline_dark.snapshot" \
  "source ~/.config/tmux/tmuxline_light.snapshot"

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" \
  | while read pane_line
    do
      IFS=' ' read -ra pane_fields <<< "$pane_line"
      if [[ "${pane_fields[1]}" == *[V,v]im* && "$pane_current_command" != ssh ]]; then
        tmux send-keys -t ${pane_fields[0]} Escape
        tmux send-keys -t ${pane_fields[0]} ":call theme#MacBackground()" Enter
      fi
    done
