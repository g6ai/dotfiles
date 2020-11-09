#!/usr/bin/env bash

tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" | \
    grep -E "bash" | \
    cut -f 1 -d " " | \
    xargs -I PANE tmux send-keys -t PANE 'eval $(tmux showenv -s DISPLAY)' Enter
