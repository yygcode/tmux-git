#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/scripts/helpers.sh"

git_interpolation=(
    "\#{git_branch}"
    "\#{git_commit}"
    "\#{git_dirty}"
)

git_commands=(
    "#($CURRENT_DIR/scripts/git_branch.sh)"
    "#($CURRENT_DIR/scripts/git_commit.sh)"
    "#($CURRENT_DIR/scripts/git_dirty.sh)"
)

do_interpolation() {
    local pattern="$1"
    for ((i = 0; i < ${#git_commands[@]}; ++i)); do
        pattern=${pattern//${git_interpolation[$i]}/${git_commands[$i]}}
    done
    echo "$pattern"
}

interpolate_tmux_option() {
    local option="$1"
    local value="$(get_tmux_option "$option")"
    local new_value="$(do_interpolation "$value")"
    set_tmux_option "$option" "$new_value"
}

main() {
    interpolate_tmux_option "status-right"
    interpolate_tmux_option "status-left"
}
main
