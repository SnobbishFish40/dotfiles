# Bash completion for zesh.

_zesh_complete() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -W "$(zellij list-sessions -n 2>/dev/null | awk '{print $1}')" -- "$cur"))
}
complete -F _zesh_complete zesh
