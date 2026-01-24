local opt = vim.opt

-- General Editor Behavior
opt.termguicolors = true
opt.background = "dark"
opt.mouse = "a"
opt.number = true
opt.relativenumber = false
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
opt.scrolloff = 8
opt.spell = true
opt.spelllang = "en_us"
opt.showmode = false
opt.backspace = "2"
opt.splitright = true
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 12
opt.undofile = true

-- Python indent: use one shiftwidth inside parentheses, align closing paren
vim.g.python_indent = {
  open_paren = "shiftwidth()",
  continue = "shiftwidth()",
  nested_paren = "shiftwidth()",
  closed_paren_align_last_line = false,
}

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
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- Start with all folds open when opening a file
    vim.opt_local.foldlevel = 99
  end,
})

-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})

-- =============================================================================
-- AGENT COLLISION HANDLING
-- =============================================================================

-- 1. Enable autoread (standard setting)
vim.o.autoread = true

-- 2. Force a disk check whenever we focus the window or enter a buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "checktime",
})

-- 3. Notification (Optional)
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.notify("File updated by Agent", vim.log.levels.INFO)
    end,
})

-- Disable spell check for utility buffers (prevents underlines in NvimTree)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "toggleterm", "telescope" },
  command = "setlocal nospell",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})
