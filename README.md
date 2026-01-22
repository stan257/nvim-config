# Neovim Configuration

This is a personal Neovim setup focused on a quantitative research workflow. It is designed to work well with Python and CSV data, using a Lua-based architecture with `lazy.nvim` and `coc.nvim`.

## Features

- **Interactive execution:** Uses `vim-slime` to send code from Neovim to an IPython session running in a tmux pane. It supports Jupyter-style cells delimited by `# %%`.
- **CSV handling:** Uses `csv.vim` for alignment and navigation of data files.
- **Python support:** Uses `coc-pyright` for type checking and `@yaegassy/coc-ruff` for linting and formatting.
- **Navigation:** Includes `telescope` for finding files and `nvim-tree` for file browsing. It integrates with `tmux` for seamless pane navigation.
- **Git integration:** Uses `lazygit` for a powerful git terminal interface inside Neovim.
- **Snippets:** Includes `vim-snippets` for common code blocks.

## Requirements

### System Tools
Ensure these are installed on your system before starting Neovim.

#### macOS
```sh
brew install ripgrep lazygit node xclip
# 'make' and 'gcc' are required for building Telescope extensions
xcode-select --install
```

#### Linux (Debian/Ubuntu)
```sh
sudo apt update
sudo apt install ripgrep lazygit nodejs npm xclip build-essential
```
*Note: `xclip` (or `wl-copy` on Wayland) is required for system clipboard integration.*

### Python Environment
- Python 3
- `pynvim` package (required for some plugins):
  ```sh
  pip install pynvim
  ```
- A language server (e.g., Pyright) is managed automatically by CoC, but you need a valid python interpreter in your path.

## Installation

1. Backup your existing configuration:
   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```sh
   git clone https://github.com/stan257/nvim-config.git ~/.config/nvim
   ```

3. Open Neovim. `lazy.nvim` will automatically bootstrap and install all plugins.
   ```sh
   nvim
   ```

4. (Optional) If syntax highlighting looks wrong, update the parsers:
   ```vim
   :TSUpdate
   ```

## Structure

- `init.lua`: Bootstrap and entry point.
- `lua/plugins.lua`: Plugin list and configuration (managed by `lazy.nvim`).
- `lua/mappings.lua`: Keybindings.
- `lua/options.lua`: General editor settings.

## Usage

### Code execution
Place your cursor in a block of code separated by `# %%` and press `<Space>cc` to send it to a tmux pane running IPython. You can also use `Ctrl-c Ctrl-c` to send smaller selections.

### Key mappings
- `<Space>ff`: Search for files.
- `<Space>fg`: Search for text.
- `<Space>gg`: Open LazyGit.
- `Ctrl-`: Toggle the file tree.
- `Ctrl-Enter`: Toggle the terminal.
- `Shift-h`: Previous buffer.
- `Shift-l`: Next buffer.
- `gd`: Go to definition.
- `K`: Show documentation or error details.
- `[g` / `]g`: Jump to previous/next error.
- `Tab`: Format code or complete suggestions.
