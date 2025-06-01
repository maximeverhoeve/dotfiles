require("config.lazy")

-- Show line numbers
vim.opt.number = true

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Enable mouse support
vim.opt.mouse = "a"

-- Show matching brackets
vim.opt.showmatch = true

-- Enable smart case search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable system clipboard access
vim.opt.clipboard:append("unnamedplus")

-- UI improvements
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- Allow switching buffers without saving
vim.opt.hidden = true

-- Window split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep buffer padding when scrolling
vim.opt.scrolloff = 8

