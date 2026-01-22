return {
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Show code context (e.g., current function signature) at the top of the screen
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Syntax-aware text objects (select/move based on function, class, etc.)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj
            keymaps = {
              -- af/if: Around/Inner Function
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- ac/ic: Around/Inner Class
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              -- ai/ii: Around/Inner Conditional (if/else)
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              -- al/il: Around/Inner Loop
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- Add jumps to the jumplist (Ctrl-O/I)
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}