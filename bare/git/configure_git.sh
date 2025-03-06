#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

mkdir -p $HOME/.config/git
cp "$SCRIPT_DIR/git_include_repositories" "$HOME/.config/git/"
cp "$SCRIPT_DIR/git_include_workspace" "$HOME/.config/git/"
cp "$SCRIPT_DIR/config" "$HOME/.config/git/config"

cp "$SCRIPT_DIR/allowed_signers" "$HOME/.ssh/allowed_signers"
