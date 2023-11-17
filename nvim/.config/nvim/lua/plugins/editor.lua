return {
  -- Plugins with simple configs

  -- Telescope
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/telescope.nvim',
  'jremmen/vim-ripgrep',

  -- Inline Colors
  {
    'NvChad/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('colorizer').setup {
        user_default_options = {
          names = false,
          mode = "background",
          tailwind = false,
          virtualtext = "■",
          always_update = true
        },
      }
    end
  },

  -- GIT and copilot
  'github/copilot.vim',
  'lewis6991/gitsigns.nvim',

  -- Navigation
  'christoomey/vim-tmux-navigator',

  -- blankline indent
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require("ibl").setup {
        indent = { char = '│' },
        whitespace = { remove_blankline_trail = false },
        scope = { enabled = false },
      }
    end
  },
  -- fast commenting
  'tpope/vim-commentary',

  -- brackets auto pair
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  },

  --change surround real fast
  'tpope/vim-surround',

  -- Find and replace vscode like
  {
    'windwp/nvim-spectre',
    keys = {
      { '<leader>fr', function() require('spectre').open() end },
    },
  },

  -- Show discord users that u are superior
  {
    'andweeb/presence.nvim',
    config = function()
      require('presence').setup({
        auto_update       = true,
        neovim_image_text = 'Help, How do I quit this thing?',
        main_image        = 'neovim',
      })
    end
  },
}
