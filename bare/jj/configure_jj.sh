#/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

mkdir -p "$HOME/Library/Application Support/jj"

cp "$SCRIPT_DIR/config.toml" "$HOME/Library/Application Support/jj"
