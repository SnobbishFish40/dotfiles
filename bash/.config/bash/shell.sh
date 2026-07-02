# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# Autocompletion
source /usr/share/bash-completion/bash_completion

# Path
export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/omakub/bin:$PATH"
export PATH="$HOME/.local/share/flutter/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
set +h

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Toolchain envs
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
