#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

cp "$SCRIPT_DIR/config.fish" "$HOME/.config/fish/"
cp "$SCRIPT_DIR/functions/fish_prompt.fish" "$HOME/.config/fish/functions/"
