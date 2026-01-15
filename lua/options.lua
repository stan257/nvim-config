local opt = vim.opt

-- General Editor Behavior
opt.termguicolors = true
opt.background = "dark"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.autoindent = true
opt.smartcase = true
opt.ignorecase = true
opt.laststatus = 2
opt.whichwrap:append("<,>,[,]")
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.spell = true
opt.spelllang = "en_us"
opt.showmode = false
opt.backspace = "2"
opt.splitright = true
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 12

-- Netrw settings (using nvim-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.fillchars = { eob = " " }
opt.splitkeep = "screen"
opt.laststatus = 3

-- Plugin Variables
vim.g.AutoPairsFlyMode = 0
vim.g.c_no_curly_error = 1
vim.g.ycm_confirm_extra_conf = 0

-- Gruvbox Material Settings
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 0
vim.g.gruvbox_material_diagnostic_line_highlight = 0
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

-- Autocommands (Ported from init.vim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "java", "noir" },
  command = "setlocal commentstring=//\\ %s",
})

-- Build commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  command = [[setlocal makeprg=gcc\ '%'\ -o\ '%:r'\ -std=gnu11]],
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = [[setlocal makeprg=g++\ '%'\ -o\ '%:r'\ -std=c++17\ -O3\ -fsanitize=undefined,address]],
})

-- Folding
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "set foldmethod=indent",
})

-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})
