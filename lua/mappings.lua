local keymap = vim.keymap.set

-- Don't save to register when 'x' is pressed
keymap({ "n", "v" }, "x", "\"_x")
keymap({ "n", "v" }, "X", "\"_X")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>")
keymap("n", "<leader>mm", ":Telescope media_files<cr>")
keymap("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap("n", "<leader>fb", ":Telescope buffers<cr>")
keymap("n", "<leader>fh", ":Telescope help_tags<cr>")

-- Tab/Buffer Navigation
keymap({ "n", "i" }, "<C-Left>", "<ESC>:tabprevious<CR>")
keymap({ "n", "i" }, "<C-Right>", "<ESC>:tabnext<CR>")

-- Terminal Escape
keymap("t", "<C-ESC>", "<C-\\\><C-N>")

-- Commenting (Ctrl-/)
keymap({ "n", "i", "v" }, "<C-/>", function()
  return vim.fn.mode() == "i" and "<ESC>:Commentary<CR>" or ":Commentary<CR>"
end, { expr = true })

-- Toggle Floating Terminal (Ctrl-Enter)
keymap({ "n", "i", "t" }, "<C-Enter>", function()
  local cmd = vim.fn.mode() == "t" and "<C-\\\><C-N>:ToggleTerm<CR>" or "<ESC>:ToggleTerm<CR>"
  return cmd
end, { expr = true })

-- Toggle File Explorer (Ctrl-`)
keymap({ "n", "i", "t" }, "<C-`>", function()
  local cmd = vim.fn.mode() == "t" and "<C-\\\><C-N>:NvimTreeToggle<CR>" or "<ESC>:NvimTreeToggle<CR>"
  return cmd
end, { expr = true })

-- Shift-Tab to unindent
keymap("v", "<Tab>", ">gv")
keymap("v", "<S-tab>", "<gv")

-- CoC Configuration (Tab completion)
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "\\<Tab>" : coc#refresh()', { silent = true, expr = true })
keymap("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', { expr = true })
keymap("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { silent = true, expr = true })

-- Global check_backspace for CoC
_G.check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- CoC Code Navigation
keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

-- CoC Diagnostics
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Documentation
keymap("n", "K", ":call ShowDocumentation()<CR>", { silent = true })
vim.cmd([[ 
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
]])

-- CoC Snippets
vim.g.coc_snippet_next = "<c-k>"
vim.g.coc_snippet_prev = "<c-l>"

-- Slime (REPL)
vim.g.slime_target = "tmux"
vim.g.slime_python_ipython = 1
vim.g.slime_dispatch_ipython_pause = 100
keymap("n", "<leader>cc", "/^# %%<CR>jV/^# %%<CR>k:SlimeSend<CR>")

-- Copilot
keymap("i", "<C-J>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true
