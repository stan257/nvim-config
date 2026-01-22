return {
  { "tpope/vim-fugitive" },
  { "kdheepak/lazygit.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- Show blame on current line (like GitLens)
        current_line_blame_opts = {
          delay = 500,
        },
      })
    end
  },
}
