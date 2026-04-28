# dotfiles

My personal development environment configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

**Neovim**:  custom config built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with lazy.nvim as the plugin manager. Includes Telescope, Treesitter, LSP, Harpoon, Oil, Gitsigns, Trouble, Marks, and more. Also includes keymaps for Spotify playback control (play/pause, next, previous) via `playerctl`.

**Alacritty**:  GPU-accelerated terminal, custom configured with automatic font size switching between laptop and external monitor via a udev-triggered script.

**Zellij**:  terminal multiplexer with custom keybindings (locked mode by default, `Ctrl+Space` to unlock), pane frames disabled, compact layout, and a collection of themes. Includes zjstatus plugin for a custom status bar with a live music indicator showing the currently playing song.

**sesh**:  a "fuzzy" session switcher script at `zellij/.local/bin/sesh`, run `sesh --help` for usage.

**song.sh**:  a status bar helper script at `zellij/.local/bin/song.sh` that outputs the currently playing song name and play/pause icon via `playerctl`, used by the zjstatus music indicator.

## Dependencies

- [Neovim](https://neovim.io/) (0.11+)
- [Alacritty](https://alacritty.org/)
- [Zellij](https://zellij.dev/) (0.44+)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [playerctl](https://github.com/altdesktop/playerctl) (for Spotify keymaps and song status bar)
- [xdotool](https://github.com/jordansissel/xdotool) (for session switching)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (for fuzzy directory picking)
- [fzf](https://github.com/junegunn/fzf) (used by zoxide's interactive mode)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter) (0.25+ for Treesitter parser compilation)
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Installation

```bash
# Install stow
sudo apt install stow

# Clone the repo
git clone https://github.com/SnobbishFish40/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow whichever configs you want
stow nvim
stow alacritty
stow zellij
```

Open Neovim and lazy.nvim will automatically bootstrap and install all plugins on first launch.

## Structure

```
dotfiles/
├── nvim/.config/nvim/          # Neovim configuration
│   ├── init.lua                # Entry point
│   ├── lua/
│   │   ├── options.lua         # Editor options
│   │   ├── keymaps.lua         # Key mappings
│   │   ├── autocmds.lua        # Autocommands
│   │   └── plugins/            # Plugin specs (one per file)
│   └── lazy-lock.json          # Pinned plugin versions
├── alacritty/.config/alacritty/ # Alacritty terminal config
│   ├── alacritty.toml          # Main config
│   ├── font/                   # Font size configs for different displays
│   └── themes/                 # Terminal colour themes
├── alacritty/.local/bin/       # Alacritty-related scripts
│   └── update-alacritty-font.sh # Auto font switching script
└── zellij/.config/zellij/      # Zellij multiplexer config
    ├── config.kdl              # Main config
    ├── themes/                 # Zellij colour themes
    ├── layouts/                # Custom layouts
    └── plugins/                # Zellij plugins
```

## Notes

- **Alacritty font switching:** The `update-alacritty-font.sh` script detects connected monitors and swaps font sizes. For automatic switching, set up a udev rule at `/etc/udev/rules.d/99-monitor-font.rules` and run the script from `~/.profile` on login. The script has hardcoded paths that need updating per machine.
- **Zellij theme_dir:** Zellij 0.44.0 has a bug where it doesn't auto-resolve the themes directory. The `theme_dir` path in `config.kdl` is hardcoded and needs updating to match your home directory. This is fixed in the next release.
- **Zellij keybindings:** Default mode is locked. Press `Ctrl+Space` to enter normal mode, then use mode keys (p for pane, t for tab, r for resize, etc.).
