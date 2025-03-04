#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

mkdir -p $HOME/.config/tmux/
cp "$SCRIPT_DIR/tmux.conf" "$HOME/.config/tmux/"
