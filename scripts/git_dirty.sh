#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/helpers.sh"

print_dirty() {
    local dir=$(tmux display-message -p -F "#{pane_current_path}")
    local stat=$(cd "$dir" && git diff --shortstat)
    local dirty=""
    [ -n "$stat" ] && dirty="-dirty"

    echo "$dirty"
}

main() {
    print_dirty
}
main
