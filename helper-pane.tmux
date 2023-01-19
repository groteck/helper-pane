#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key -n 'C-t' run-shell "$CURRENT_DIR/scripts/helper-pane.sh"
