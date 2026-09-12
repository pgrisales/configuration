-- ============================================================================
-- Minimal Neovim 0.12+
-- Mostly vanilla Neovim + Telescope + Tree-sitter.
-- ============================================================================

-- Space is the prefix for our custom shortcuts.
vim.g.mapleader = " "

-- Short aliases to avoid repeatedly writing vim.opt / vim.keymap.set.
local opt = vim.opt
local map = vim.keymap.set

-- ============================================================================
-- EDITOR
-- ============================================================================

-- Show the current real line number.
opt.number = true

-- Other lines show their distance from the cursor; useful for 5j, 3k, etc.
opt.relativenumber = true

-- Keep 4 lines visible above/below the cursor while scrolling.
opt.scrolloff = 4

-- A TAB character visually occupies 2 columns.
opt.tabstop = 2

-- >>, << and automatic indentation use 2 columns.
opt.shiftwidth = 2

-- Pressing Tab inserts spaces instead of a literal TAB.
opt.expandtab = true

-- Basic automatic indentation after lines such as "if ... {".
opt.smartindent = true

-- Long code lines scroll horizontally instead of wrapping.
opt.wrap = false

-- Preserve undo history after closing and reopening a file.
opt.undofile = true

-- /hello also matches Hello and HELLO.
opt.ignorecase = true

-- But /Hello becomes case-sensitive because it contains a capital letter.
opt.smartcase = true

-- Keep search results highlighted.
opt.hlsearch = true

-- Use the terminal's color palette instead of 24-bit RGB colors.
--vim.cmd.colorscheme("default")
opt.termguicolors = false

-- Normal yanks/pastes use the system clipboard.
opt.clipboard = "unnamedplus"

-- :vsplit creates the new window on the right.
opt.splitright = true

-- :split creates the new window below.
opt.splitbelow = true

-- How quickly idle events are triggered.
opt.updatetime = 300

-- Wait at most 300ms for multi-key mappings.
opt.timeoutlen = 300

-- ============================================================================
-- KEYMAPS
-- ============================================================================

-- Esc removes highlighting left behind by / searches.
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- x deletes into Vim's black-hole register.
-- This prevents x from replacing whatever you previously yanked.
map("n", "x", '"_x')

-- Space + e opens Neovim's built-in file explorer.
map("n", "<leader>e", "<cmd>Explore<CR>")

-- Ctrl+h/j/k/l moves directly between split windows.
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Ctrl+d/u scrolls half a page and then centers the cursor.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- n/N jumps between search results and centers the result.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- ============================================================================
-- PLUGINS
-- Uses Neovim 0.12's built-in package manager: vim.pack
-- ============================================================================

vim.pack.add({
  -- Plenary contains utility functions required by Telescope.
  { src = "https://github.com/nvim-lua/plenary.nvim" },

  -- Telescope is the fuzzy finder.
  -- It finds files, searches project text, switches buffers, etc.
  { src = "https://github.com/nvim-telescope/telescope.nvim" },

  -- Tree-sitter provides parsers for better syntax understanding/highlighting.
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- ============================================================================
-- TELESCOPE
-- ============================================================================

-- Space + f:
-- Fuzzy-find files below Neovim's current working directory.
map("n", "<leader>f", function()
  require("telescope.builtin").find_files()
end)

-- Space + g:
-- Search text inside all files below the current directory.
-- Requires `ripgrep` (`rg`) to be installed.
map("n", "<leader>g", function()
  require("telescope.builtin").live_grep()
end)

-- Space + b:
-- Fuzzy-find among files already open in Neovim.
map("n", "<leader>b", function()
  require("telescope.builtin").buffers()
end)

-- Space + h:
-- Fuzzy-search Neovim's built-in :help documentation.
map("n", "<leader>h", function()
  require("telescope.builtin").help_tags()
end)

-- ============================================================================
-- TREE-SITTER
-- ============================================================================

-- Add/remove languages here depending on what you actually use.
local treesitter_languages = {
  "bash",
  "c",
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "toml",
  "typescript",
  "yaml",
  "asm",
  "go",
  "php",
  "zig",
  "ruby",
}

-- Install missing parsers.
require("nvim-treesitter").install(treesitter_languages)

-- Enable Tree-sitter highlighting for those languages.
vim.api.nvim_create_autocmd("FileType", {
  pattern = treesitter_languages,
  callback = function()
    vim.treesitter.start()
  end,
})
