#!/bin/bash

# Define session and window names
SESSION="dsa"
WINDOW_0="server"
WINDOW_1="cpp"
WINDOW_2="java"

# Start directory. Note that Tmux doesn't expand "~" when we are passing the "-c" flag
# in below setup. SO better to explicitly expand via "$HOME" in Bash before
START_DIR="$HOME/Projects/code-journal"
# We're passing "-c" while splitting windows too as tmux
# might not open in current directory and default to "~"

# Check if the session already exists
tmux has-session -t $SESSION 2>/dev/null

# If not existing, run below setup
if [ $? != 0 ]; then
    # Create new named session (dsa) and with named window (server) at given directory
    tmux new-session -d -s $SESSION -n $WINDOW_0 -c $START_DIR
    # Run command to start server within this window
    tmux send-keys -t $SESSION:$WINDOW_0 "pnpm dev" C-m

    # Create new window (cpp) at given subdirectory
    tmux new-window -t $SESSION -n $WINDOW_1 -c $START_DIR/.playground/cpp
    # Split this window vertically into 2 panes
    tmux split-window -h -c $START_DIR/.playground/cpp -t $SESSION:$WINDOW_1
    tmux split-window -v -c $START_DIR/.playground/cpp -t $SESSION:$WINDOW_1.1
    # Run commands within each pane for this window
    tmux send-keys -t $SESSION:$WINDOW_1.0 "watch -n 1 cat code.cpp" C-m
    tmux send-keys -t $SESSION:$WINDOW_1.1 "nano input.txt" C-m
    tmux send-keys -t $SESSION:$WINDOW_1.2 "watch -n 1 cat output.txt" C-m

    # Create new window (java) at given subdirectory
    tmux new-window -t $SESSION -n $WINDOW_2 -c $START_DIR/.playground/java
    # Split this window horizontally then vertically into 3 panes
    tmux split-window -h -c $START_DIR/.playground/java -t $SESSION:$WINDOW_2
    tmux split-window -v -c $START_DIR/.playground/java -t $SESSION:$WINDOW_2.1
    # Run commands within certain panes for this window
    tmux send-keys -t $SESSION:$WINDOW_2.1 "nano input.txt" C-m
    tmux send-keys -t $SESSION:$WINDOW_2.2 "watch -n 1 cat output.txt" C-m

    # Set the currently active window and pane
    tmux select-window -t $SESSION:1
    tmux select-pane -t $SESSION:$WINDOW_1.0
fi

# Attach to the session
tmux attach -t $SESSION
