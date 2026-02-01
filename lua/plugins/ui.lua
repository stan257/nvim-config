return {
  -- Discoverability: Popup that shows possible keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- Leave empty to use default settings
    },
  },

  -- Visual Structure: Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│", -- Subtle vertical line
      },
      scope = {
        enabled = true, -- Highlights the current indentation level
        show_start = false,
        show_end = false,
      },
    },
  },

  -- Highlight TODO, FIXME, NOTE, etc. in comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {
      -- defaults are usually fine
    },
  },
}
