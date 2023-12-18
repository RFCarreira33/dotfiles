local opt = vim.opt

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

opt.shiftwidth = 2
opt.tabstop = 4
opt.smartindent = true

opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true
opt.smartindent = true

vim.g.markdown_recommended_style = 0

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
