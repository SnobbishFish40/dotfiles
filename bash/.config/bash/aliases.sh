# File system
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias fd='fdfind'
alias cd='z'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias g='git'
alias d='docker'
alias bat='batcat'
alias x="xdg-open"

# Media
alias pp="playerctl play-pause"

# System
alias fixfont="~/.local/bin/update-alacritty-font.sh"
alias rungpu="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# Clipboard
alias xcopy="xclip -selection clipboard"
alias xpaste="xclip -selection clipboard -o"

# VPN
alias vpn="expressvpn connect"
alias novpn="expressvpn disconnect"

# Zellij
alias zls='zellij list-sessions'
alias zol='zellij action override-layout main'
alias zd='zellij action detach'

# Compression
alias decompress="tar -xzf"
