-- ===========================================================================
-- PLUGIN CONFIGURATIONS (Setup calls)
-- ===========================================================================

-- Terminal Setup (ToggleTerm)
require("toggleterm").setup()

-- File Explorer (Nvim-Tree)
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    view = {
        width = 34,
    },
    renderer = {
        group_empty = true,
    },
})

-- Fuzzy Finder (Telescope)
require("telescope").setup({
    extensions = {
        media_files = {
            find_cmd = "rg"
        }
    },
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                preview_height = 0.5,
            },
        },
        mappings = {
            i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
        },
    },
})

require("telescope").load_extension("media_files")
require("telescope").load_extension("fzy_native")

-- Status Line (Lualine)
require("lualine").setup({
    options = {
        theme = "gruvbox-material",
        icons_enabled = true,
        section_separators = {left="", right=""},
        component_separators = {left="", right=""},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
})

-- Tab Line (Bufferline)
require("bufferline").setup()

-- Syntax Highlighting (Treesitter)
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c", "cpp", "python", "lua", "typescript", "javascript", "vim", "vimdoc", "query", "haskell", "cuda", "bash", "java"
    },
    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
        disable = function(_, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = false,
    },
})

require("treesitter-context").setup()
