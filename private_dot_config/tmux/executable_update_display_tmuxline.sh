#!/usr/bin/env bash

tmux if-shell "[[ $(defaults read -g AppleInterfaceStyle) = Dark ]]" \
  "source ~/.config/tmux/tmuxline_dark.snapshot" \
  "source ~/.config/tmux/tmuxline_light.snapshot"

DISPLAY=$(tmux show-env | sed -n 's/^DISPLAY=//p')

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" \
  | while read pane_line
    do
      IFS=' ' read -ra pane_fields <<< "$pane_line"
      if [[ "${pane_fields[1]}" == *sh && "${pane_fields[1]}" != ssh ]]; then
        #tmux if-shell "[[ -f ~/.config/tmux/tmuxline.snapshot ]]" "source ~/.config/tmux/tmuxline.snapshot" Enter
        tmux send-keys -t ${pane_fields[0]} "export DISPLAY=$DISPLAY" Enter
      elif [[ "${pane_fields[1]}" == *[V,v]im* && "$pane_current_command" != ssh ]]; then
        tmux send-keys -t ${pane_fields[0]} Escape
        #tmux send-keys -t ${pane_fields[0]} ":call UpdateTmuxlineByMode()" Enter
        tmux send-keys -t ${pane_fields[0]} ":call theme#MacBackground()" Enter
        tmux send-keys -t ${pane_fields[0]} ":let \$DISPLAY = \"$DISPLAY\"" Enter
        #tmux send-keys -t ${pane_fields[0]} ":xrestore" Enter
      fi
    done
