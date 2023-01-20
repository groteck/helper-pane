#!/bin/bash

P=$(tmux show -sqv @helperpane)

function createHelperpane() {
    P=$(tmux splitw -v -p 18 -PF'#{pane_id}' -c '#{pane_current_path}')
    tmux set -sq @helperpane "$P"
}

# If there is no helper pane create one
if [ -z "$P" ]; then
    createHelperpane
    exit 0
fi

# if the helper pane is visible, hide it
if [ -z "$New" ] && [ -n "$P" ] && tmux lsp -F'#{pane_id}'| grep -q ^$P; then
    tmux set -g visual-activity off
    tmux break-pane -d -s $P
    tmux set -g visual-activity on
    exit 0
fi

# if @helperpane is set but there is no pane with that id, create a new one
if [ -n "$P" ] && ! tmux display -p '#{W:#{pane_id} }' | tr " " "\n" | grep -q ^$P; then
    createHelperpane
    exit 0
fi

# if the helper pane is hidden, show it
if [ -n "$P" ] && ! tmux lsp -F'#{pane_id}'| grep -q ^$P; then
    tmux join-pane -v -p 18 -s $P
    exit 0
fi
