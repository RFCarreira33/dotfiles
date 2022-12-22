-- This file installs plugins and configures them.
local g = vim.g
local cmd = vim.cmd

-- Packer and PLugins
local packer = require 'packer'
local util = require 'packer.util'

packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate"
	}

	-- theme and rice
	use 'marko-cerovac/material.nvim'
	use 'romgrk/barbar.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'

	-- utils
	use 'lukas-reineke/indent-blankline.nvim'
	use 'tpope/vim-commentary'
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use 'tpope/vim-surround' --change surround real fast

	-- Telescope
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/telescope.nvim'
	use 'jremmen/vim-ripgrep'

	-- Navigation
	use 'christoomey/vim-tmux-navigator'

	--Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}

	-- Git and Copilot
	use 'github/copilot.vim'
	use 'lewis6991/gitsigns.nvim'


	--LSP and Completion
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
end)

-- Blank line
require("indent_blankline").setup {
	show_current_context = true,
	show_current_context_start = true,
}

-- Autopairs
require("nvim-autopairs").setup {}

-- Nvim Tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

-- TreeSitter
local configs = require 'nvim-treesitter.configs'
configs.setup {
	ensure_installed = { 'lua', 'html', 'javascript', 'php', 'java', 'json' },
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true }
}

-- LSP and Completion
local lsp = require('lsp-zero')
lsp.preset("recommended")

-- require cmp to remap
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	-- map <CR> to confirm
	['<C-a>'] = cmp.mapping.confirm({ select = true }),
	['<Cr>'] = cmp.mapping.confirm({ select = true }),
	-- map <C-e> to close menu
	['<C-e>'] = cmp.mapping.close(),
	-- map <C-f> to scroll down
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- map <C-d> to scroll up
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	-- map <C-j> to select next item
	['<C-j>'] = cmp.mapping.select_next_item(),
	-- map <C-k> to select previous item
	['<C-k>'] = cmp.mapping.select_prev_item(),
})

-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.ensure_installed({
	"sumneko_lua",
	"html",
	"cssls",
})

lsp.setup()

-- Rice

-- ColorScheme
g.material_style = 'darker'
cmd('colorscheme material')

-- lualine
local lualine = require('lualine')
local theme = require("lualine.themes.material")
lualine.setup({
	options = {
		theme = theme,
	},
})
