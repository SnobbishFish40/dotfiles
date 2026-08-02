# Bash completion for sesh.

_sesh_complete() {
    local cur sessions
    cur="${COMP_WORDS[COMP_CWORD]}"
    sessions="$(tmux list-sessions -F '#{session_name}' 2>/dev/null)"
    COMPREPLY=( $(compgen -W "${sessions}" -- "${cur}") )
}

complete -F _sesh_complete sesh
