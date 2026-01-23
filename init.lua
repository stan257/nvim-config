-- ============================================================================
-- BOOTSTRAP LAZY.NVIM
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader before loading plugins
vim.g.mapleader = " "

-- Guard against stale/invalid cwd (e.g., deleted working dir in tmux)
do
  local cwd = vim.loop.cwd()
  if not cwd or cwd == "" or vim.fn.isdirectory(cwd) ~= 1 then
    vim.cmd("cd " .. vim.fn.expand("~"))
  end
end

-- ============================================================================
-- LOAD CONFIGURATION MODULES
-- ============================================================================
require("options")   -- Basic Neovim settings
require("plugins")   -- Plugin definitions and lazy.nvim setup
require("mappings")  -- Keybindings
require("init")      -- Your existing lua/init.lua (Treesitter, Lualine, etc.)

-- Load legacy Cyrillic mappings
vim.cmd("source " .. vim.fn.stdpath("config") .. "/cyrilic.vim")
