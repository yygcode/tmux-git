#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/helpers.sh"

print_git_branch() {
    local dir=$(tmux display-message -p -F "#{pane_current_path}")
    local branch=$(cd "$dir" && git symbolic-ref --short HEAD)
    echo $branch
}

main() {
    print_git_branch
}
main
