" ============================================================================
" CORE SETTINGS
" ============================================================================
set termguicolors                               " Enable 24-bit RGB color in the TUI
set shell=/bin/zsh                              " Use Zsh as the default shell

" ============================================================================
" PLUGINS (Managed by vim-plug)
" ============================================================================
call plug#begin()

" UI Components
Plug 'nvim-lualine/lualine.nvim'                " Status line at the bottom
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }  " Tab-like buffer line at the top
Plug 'nvim-tree/nvim-tree.lua'                  " File explorer tree
Plug 'nvim-tree/nvim-web-devicons'              " Icons for file types
Plug 'akinsho/toggleterm.nvim', { 'tag': '*' }  " Floating terminal

" LSP & Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Core LSP client (VSCode-like)
let g:coc_global_extensions = ['coc-pyright', '@yaegassy/coc-ruff'] " Auto-install Python & Ruff

" Utilities
Plug 'tpope/vim-commentary'                     " Comment code with 'gcc'
Plug 'honza/vim-snippets'                       " Massive library of code snippets (Quant friendly)

" Syntax & Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Advanced syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter-context'              " Sticky function headers

" Search & Navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim'            " Powerful fuzzy finder
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }
Plug 'christoomey/vim-tmux-navigator'           " Seamless navigation between Vim and Tmux panes

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'

" Quant / Data Science Workflow
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'chrisbra/csv.vim'                         " Advanced CSV editing and querying
Plug 'jpalardy/vim-slime'                       " Send code to REPL (Jupyter-like execution)

call plug#end()

" ============================================================================
" GENERAL EDITOR BEHAVIOR
" ============================================================================
set background=dark
syntax on
set mouse=a             " Enable mouse support
set ts=4 sts=4 sw=4     " Tab = 4 spaces
set laststatus=2        " Always show status line
set smartindent         " Smart auto-indenting
set autoindent
set number              " Show line numbers
set relativenumber      " Relative line numbers (good for jumping)
set smartcase           " Case insensitive search unless capital used
set whichwrap+=<,>,[,]  " Allow cursor to wrap lines

" Disable annoying auto-pairs fly mode
let g:AutoPairsFlyMode=0
let c_no_curly_error=1

" ============================================================================
" COLORSCHEME
" ============================================================================
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_diagnostic_text_highlight = 0
let g:gruvbox_material_diagnostic_line_highlight = 0
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
colorscheme gruvbox-material

" ============================================================================
" KEY MAPPINGS
" ============================================================================
" Don't save to register when 'x' is pressed (prevents overwriting clipboard) 
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" Telescope (Fuzzy Finder) mappings
let mapleader = "\<Space>"
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>mm :Telescope media_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

" Tab/Buffer Navigation
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>
imap <C-Left> <ESC>:tabprevious<CR>
imap <C-Right> <ESC>:tabnext<CR>

" Terminal Escape
tmap <C-ESC> <C-\\><C-N>

" Commenting shortcut (Ctrl-/)
nmap <C-/> :Commentary<CR>
imap <C-/> <ESC>:Commentary<CR>
vmap <C-/> :Commentary<CR>

" Toggle Floating Terminal (Ctrl-Enter)
imap <C-Enter> <ESC>:ToggleTerm<CR>
nmap <C-Enter> <ESC>:ToggleTerm<CR>
tmap <C-Enter> <C-\\><C-N>:ToggleTerm<CR>

" Toggle File Explorer (Ctrl-`)
imap <C-`> <ESC>:NvimTreeToggle<CR>
nmap <C-`> <ESC>:NvimTreeToggle<CR>
tmap <C-`> <C-\\><C-N>:NvimTreeToggle<CR>

" ============================================================================
" LANGUAGE SPECIFIC BUILD SETTINGS
" ============================================================================
autocmd FileType c,cpp,java,noir setlocal commentstring=//\ %s
autocmd FileType c       setlocal makeprg=gcc\ '%\'\ -o\ '%:r'\ -std=gnu11
autocmd FileType cpp     setlocal makeprg=g++\ '%\'\ -o\ '%:r'\ -std=c++17\ -O3\ -fsanitize=undefined,address
autocmd FileType haskell setlocal makeprg=ghc\ --make\ '%'
autocmd FileType java    setlocal makeprg=javac\ '%'
autocmd FileType tex     setlocal makeprg=xelatex\ -interaction\ nonstopmode\ -halt-on-error\ '%'

" Spell check for text files
autocmd BufEnter,BufNewFile *.{txt,md,html,tex} setlocal spell spelllang=en_us

" ============================================================================
" MISC UTILITIES
" ============================================================================
" Cyrillic keymap support
source ~/.config/nvim/cyrilic.vim

set noshowmode          " Hide mode since Lualine shows it
set clipboard=unnamedplus " Use system clipboard

" Shift-Tab to unindent
vmap <Tab> >gv
vmap <S-tab> <gv
set backspace=2

" ============================================================================
" COC.NVIM (LSP) SETTINGS
" ============================================================================
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
set pumheight=12

" Tab completion logic
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enter confirms completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Code Navigation (Go to definition, etc.)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Documentation popup (K)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Diagnostic navigation ([g and ]g)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Snippet navigation
let g:coc_snippet_next = "<c-k>"
let g:coc_snippet_prev = "<c-l>"

" Restart LSP with F3
map <F3> <ESC>:CocRestart <CR>
imap <F3> <ESC>:CocRestart <CR>
let b:coc_pairs_disabled = ['<', '`']

" ============================================================================
" AI & COPILOT SETTINGS
" ============================================================================
" Disable Copilot for large files
autocmd BufReadPre *
            \ let f=getfsize(expand("<afile>"))
            \ | if f > 100000 || f == -2
            \ | let b:copilot_enabled = v:false
            \ | endif

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ============================================================================
" QUANT / DATA SCIENCE SETTINGS
" ============================================================================
" Disable auto commenting on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Slime (REPL) Configuration
let g:slime_target = "tmux"                " Use tmux for REPL
let g:slime_python_ipython = 1             " Optimize for IPython
let g:slime_dispatch_ipython_pause = 100   " Delay to prevent broken pastes

" Execute Jupyter-style 'cell' (# %% ... # %%)
nmap <leader>cc /^# %%<CR>jV/^# %%<CR>k:SlimeSend<CR>

" Visuals
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight DiffText guibg=#003f66
set cursorline
set spelllang=en_us
set spell

" Load Lua configs
lua require('init')