# Neovim configuration

This is a personal Neovim setup focused on a quantitative research workflow. It is designed to work well with Python and CSV data.

## Features

- **Interactive execution:** Uses `vim-slime` to send code from Neovim to an IPython session running in a tmux pane. It supports Jupyter-style cells delimited by `# %%`.
- **CSV handling:** Uses `csv.vim` for basic alignment and navigation of data files within the editor.
- **Python support:** Uses `coc-pyright` for type checking and `@yaegassy/coc-ruff` for linting and formatting.
- **Navigation:** Includes `telescope` for finding files and `nvim-tree` for file browsing. It also integrates with `tmux` for moving between panes.
- **Snippets:** Includes `vim-snippets` for common code blocks in Python and other languages.

## Requirements

- Neovim
- Tmux (for code execution)
- Node.js (for coc.nvim)
- Python 3
- Ripgrep

## Installation

1. Install `vim-plug`.
2. Clone this repository into `~/.config/nvim`.
3. Open Neovim and run `:PlugInstall`.
4. Install the required LSP extensions via `:CocInstall coc-pyright @yaegassy/coc-ruff`.

## Usage

### Code execution
Place your cursor in a block of code separated by `# %%` and press `<Space>cc` to send it to a tmux pane running IPython. You can also use `Ctrl-c Ctrl-c` to send smaller selections.

### Key mappings
- `<Space>ff`: Search for files.
- `<Space>fg`: Search for text.
- `Ctrl-`: Toggle the file tree.
- `Ctrl-Enter`: Toggle the terminal.
- `gd`: Go to definition.
- `K`: Show documentation.
- `Tab`: Format code or complete suggestions.
