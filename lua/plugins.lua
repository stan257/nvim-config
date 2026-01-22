require("lazy").setup({
  -- ==========================================================================
  -- UI / AESTHETICS
  -- ==========================================================================
  { "nvim-lualine/lualine.nvim" },              -- Status line
  { "akinsho/bufferline.nvim", version = "*" }, -- Tab-like buffer bar
  { "nvim-tree/nvim-tree.lua" },                -- File explorer
  { "nvim-tree/nvim-web-devicons" },           -- Icons for plugins
  { "akinsho/toggleterm.nvim", version = "*" }, -- Better terminal management

  -- ==========================================================================
  -- LSP, COMPLETION & SNIPPETS
  -- ==========================================================================
  { 
    "neoclide/coc.nvim", 
    branch = "release", 
    init = function()
      -- Global extensions for Python and Ruff (Linter)
      vim.g.coc_global_extensions = { 'coc-pyright', '@yaegassy/coc-ruff' }
    end 
  },
  { "honza/vim-snippets" }, -- Snippet collection

  -- ==========================================================================
  -- EXTERNAL MODULES (MODULAR CONFIG)
  -- ==========================================================================
  -- Imports plugin specs from lua/plugins/git.lua and lua/plugins/treesitter.lua
  { import = "plugins.git" },
  { import = "plugins.treesitter" },
  { import = "plugins.editing" },
  { import = "plugins.ui" },

  -- ==========================================================================
  -- UTILITIES & NAVIGATION
  -- ==========================================================================
  { "tpope/vim-commentary" },           -- Easy commenting (gc)
  { "christoomey/vim-tmux-navigator" }, -- Seamless nvim/tmux navigation
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  },

  -- ==========================================================================
  -- TELESCOPE (FUZZY FINDER)
  -- ==========================================================================
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzy-native.nvim", build = "make" },

  -- ==========================================================================
  -- COLORSCHEMES
  -- ==========================================================================
  { "morhetz/gruvbox" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000, config = function()
      pcall(vim.cmd, "colorscheme gruvbox-material")
  end },

  -- ==========================================================================
  -- DATA SCIENCE / EDITING
  -- ==========================================================================
  { "chrisbra/csv.vim" },  -- Better CSV viewing/alignment
  { "jpalardy/vim-slime" }, -- Send code to REPL/Tmux
  
  -- Automatic pairing of brackets/quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        map_cr = false, -- Handled manually in lua/mappings.lua
        map_bs = true,
        check_ts = true, -- Use Treesitter to be smarter
      })
    end,
  },
})
