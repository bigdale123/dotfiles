-- Requirements
---------------
require("config.lazy")

-- Appearance
-------------
vim.opt.termguicolors = true
vim.cmd([[colorscheme default]])
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NonText guibg=none]])
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])

-- Basic Settings
-----------------
vim.opt.compatible = false  -- Disable compatibility to old-time vi

-- Selection Behavior
---------------------
vim.opt.showmatch = true    -- Highlight matching brackets
vim.opt.ignorecase = true   -- Case-insensitive searching
vim.opt.hlsearch = true     -- Highlight all search matches
vim.opt.incsearch = true    -- Show matches as search pattern is typed

-- Mouse and Cursor Behavior
----------------------------
vim.opt.mouse = "a"         -- Enable mouse support
vim.opt.cursorline = true   -- Highlight the current line

-- Tab and Indentation Settings
-------------------------------
vim.opt.tabstop = 4         -- Number of columns occupied by a tab
vim.opt.softtabstop = 4     -- See multiple spaces as tabstops
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.shiftwidth = 4      -- Width for auto-indents
vim.opt.autoindent = true   -- Maintain indent of current line

-- UI Enhancements
------------------
vim.opt.number = true       -- Show line numbers
vim.opt.wildmode = { "longest", "list" } -- Command-line autocomplete
-- vim.opt.colorcolumn = "80" -- Set an 80 column border for recommended line length
vim.opt.ttyfast = true      -- Enable fast terminal scrolling

-- File Type and Syntax Highlighting
------------------------------------
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax on]])

-- Clipboard
------------
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
-- vim.opt.backupdir = os.getenv("HOME") .. "/.cache/vim" -- Directory for backup files
