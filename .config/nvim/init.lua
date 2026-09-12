-- ============================================================================
-- ULTRA-FAST, ZERO-BLOAT NEOVIM CONFIG (~/.config/nvim/init.lua)
-- ============================================================================

-- Exact default Vim colors
--vim.cmd.colorscheme("vim")
vim.cmd.colorscheme("default")

-- Speed & Performance Defaults
vim.opt.termguicolors = false   -- Uses fast 16-color ANSI output over SSH
vim.opt.cursorline = false      -- Disables row redraws on every cursor movement
vim.opt.updatetime = 300        -- Snappy interface response time
vim.opt.background = "dark"

-- Essential Usability
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Relative jumps (e.g., 5j, 10k)
vim.opt.mouse = "a"             -- Full mouse support

-- Indentation (2 spaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search Improvements
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persistent Undo
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Native SSH Clipboard (OSC 52 Yanking)
vim.opt.clipboard = "unnamedplus"
if vim.env.SSH_CONNECTION then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

-- Keybindings
vim.g.mapleader = " "

-- Clear search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quick Save & Quit
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
