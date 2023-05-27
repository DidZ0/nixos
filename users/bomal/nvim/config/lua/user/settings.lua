local opt = vim.opt
local g = vim.g

-- global options --
opt.guicursor = ""
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.scrolloff = 8
opt.incsearch = true    -- Find the next match as we type the search
opt.hlsearch = true     -- Hilight searches by default
opt.viminfo = "'100,f1" -- Save up to 100 marks, enable capital marks
opt.ignorecase = true   -- Ignore case when searching...
opt.smartcase = true    -- ...unless we type a capital
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.relativenumber = true
opt.number = true
opt.signcolumn="yes:2"
opt.updatetime = 50

-- Set leader key
g.mapleader = ' '

-- Color Scheme Settings
vim.cmd("syntax enable")
opt.background="dark"
vim.cmd [[ colorscheme gruvbox ]]
