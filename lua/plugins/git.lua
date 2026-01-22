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
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500, -- Delay in ms before blame appears
        },
      })
    end
  },
}