require("settings")
require("keybinds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local to_ignore = {
  "alpha",
  "help",
  "lazy",
  "netrw",
  "oil",
  "toggleterm",
  "NvimTree",
  "mason",
  "",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local ft = vim.bo.filetype
		if to_ignore[ft] then
			return
		end

		pcall(vim.treesitter.start, 0)
	end,
})

require("lazy").setup("plugins")
require("lsp")
