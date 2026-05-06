local options = vim.opt

options.autoindent = true
options.expandtab = true
options.tabstop = 4 -- Number of spaces for a tab
options.shiftwidth = 4 -- Indentation size for autoindent
options.smartindent = true

options.guicursor = ""

options.nu = true
options.relativenumber = true

options.undofile = true

options.hlsearch = false
options.incsearch = true

options.termguicolors = true

options.scrolloff = 4

options.showmode = false
vim.opt.cmdheight = 0    -- Hide command line when not in use

