return {
  -- The premier Vim plugin for Git (adds :G commands)
  { "tpope/vim-fugitive" },

  -- A terminal UI for git (invoked via <leader>gg)
  { "kdheepak/lazygit.nvim" },

  -- Git integration for buffers (signs in gutter, line blame)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        -- Show "Git Blame" information on the current line (like GitLens)
        current_line_blame = false, -- Default to off (toggle with <leader>gb)
        current_line_blame_opts = {
          delay = 500, -- Delay in ms before blame appears
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation (next/prev hunk) - using h (hunk) to avoid collision with class mappings
          map("n", "]h", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[h", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle Git Blame" })
          map("n", "<leader>gd", gs.preview_hunk, { desc = "Preview Git Hunk" })
          map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Git Hunk" })
          map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage Git Hunk" })
        end,
      })
    end
  },
}