require("lazy").setup({
  -- UI
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim", version = "*" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "akinsho/toggleterm.nvim", version = "*" },

  -- LSP & Completion
  { "neoclide/coc.nvim", branch = "release", init = function()
    vim.g.coc_global_extensions = { 'coc-pyright', '@yaegassy/coc-ruff' }
  end },

  -- Utilities
  { "tpope/vim-commentary" },
  { "honza/vim-snippets" },
  { "tpope/vim-fugitive" },
  { "kdheepak/lazygit.nvim" },
  { "christoomey/vim-tmux-navigator" },

  -- Syntax & Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "BurntSushi/ripgrep" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzy-native.nvim", build = "make" },

  -- Colorschemes
  { "morhetz/gruvbox" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000, config = function()
      pcall(vim.cmd, "colorscheme gruvbox-material")
  end },

  -- Quant / Data Science
  { "chrisbra/csv.vim" },
  { "jpalardy/vim-slime" },
  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        map_cr = false, -- Use our <CR> mapping in lua/mappings.lua
        map_bs = true,
        check_ts = true,
      })
    end,
  },
})
