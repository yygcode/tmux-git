get_tmux_option() {
    local option="$1"
    local value="$(tmux show-option -gqv "$option")"
    # optional arg2 is default value
    echo ${value:-$2}
}

set_tmux_option() {
    local option="$1"
    local value="$2"
    tmux set-option -gq "$option" "$value"
}
