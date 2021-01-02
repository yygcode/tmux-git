#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/helpers.sh"

print_git_abbr_commit_hash() {
    local dir=$(tmux display-message -p -F "#{pane_current_path}")
    local abbr_commit_hash=$(cd "$dir" && git log -1 --pretty=format:%h)

    echo $abbr_commit_hash
}

main() {
    print_git_abbr_commit_hash
}
main
