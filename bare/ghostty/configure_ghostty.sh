#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

mkdir -p $HOME/.config/ghostty/
cp "$SCRIPT_DIR/config" "$HOME/.config/ghostty/"
