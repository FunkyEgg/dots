-- Setup
vim.cmd "colorscheme habamax"
vim.g.mapleader = " "

-- Plugins
require("config.lazy")

-- Tab Setting
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.si = true
vim.o.ai = true

-- Editor
vim.o.syntax = "off"
vim.o.termguicolors = true
vim.o.title = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = "ni"
vim.o.laststatus = 2
vim.o.cc = "80"
vim.o.showmode = false

-- Stupid bandaid fix because people are too lazy to fix it (Including me)
vim.g.c_no_curly_error = 1

-- Search options
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.hlsearch = true

-- Command Line Options
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.wildmode = "full"

-- Split Options
vim.o.splitbelow = true
vim.o.splitright = true

-- Highlight trailing whitespace
-- vim.cmd "highlight ExtraWhiteSpace ctermbg=red guibg=red"
-- vim.cmd "match ExtraWhitespace /\\s\\+$/"
-- Create an autocommand group
vim.cmd([[
augroup HighlightTrailingWhitespace
  autocmd!
  autocmd BufWinEnter,BufRead * highlight ExtraWhiteSpace ctermbg=red guibg=red
  autocmd BufWinEnter,BufRead * match ExtraWhiteSpace /\s\+$/
augroup END
]])

-- Program Options
vim.o.grepprg = "rg --vimgrep"

-- Keymap
require("config.keymap")

-- Autocmd
require("config.autocmd")
