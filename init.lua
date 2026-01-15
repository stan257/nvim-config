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

-- ============================================================================
-- LOAD CONFIGURATION MODULES
-- ============================================================================
require("options")   -- Basic Neovim settings
require("plugins")   -- Plugin definitions and lazy.nvim setup
require("mappings")  -- Keybindings
require("init")      -- Your existing lua/init.lua (Treesitter, Lualine, etc.)

-- Load legacy Cyrillic mappings
vim.cmd("source ~/.config/nvim/cyrilic.vim")
