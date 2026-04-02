#!/bin/sh

# Tmux Create Dashboard

path=${1:-$(pwd)}
basename=$(basename $path)
session=$(echo "$basename" | tr '.:' '__')

# Check if session exist
found=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | grep -Fx "$session")

if [ -n "$found" ]
then
	tmux attach-session -d -t "$session" -c "$path"
	exit 0
fi

# Create session
tmux new-session -d -s "$session"

# Check if a git repository is defined
repository=$(git status 2>&1 | grep -Fv "not a git repository")

if [ -n "$repository" ]
then
	tmux split-window -v -l 5 'git logor'
	tmux split-window -h -l 10 'git brr'
fi

# Finaly, attach to the session in the 1st pane in the 1st window
tmux select-pane -t "$session":1.1
tmux attach-session -t "$session" -c "$path"
