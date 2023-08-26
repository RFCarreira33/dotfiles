-- This files set all the common settings for the editor
local opt = vim.opt

-- Basic --
opt.nu = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.splitright = true
opt.autowrite = true
opt.expandtab = true
opt.spelllang = { 'en' }
opt.undofile = true
opt.scrolloff = 8
opt.sidescrolloff = 12
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.errorbells = false
opt.autoindent = true

-- Tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true
opt.smartindent = true

-- Markdown identation
vim.g.markdown_recommended_style = 0

-- Inline diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
