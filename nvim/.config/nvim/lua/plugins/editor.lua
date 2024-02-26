return {
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/telescope.nvim',
  'jremmen/vim-ripgrep',

  {
    'NvChad/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      user_default_options = {
        names = false,
        mode = "background",
        tailwind = false,
        virtualtext = "■",
        always_update = true
      },
    },
  },

  'github/copilot.vim',
  'lewis6991/gitsigns.nvim',

  'christoomey/vim-tmux-navigator',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = { char = '│' },
      whitespace = { remove_blankline_trail = false },
      scope = { enabled = false },
    },
  },

  'tpope/vim-commentary',

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  'tpope/vim-surround',

  {
    'windwp/nvim-spectre',
    keys = {
      { '<leader>fr', function() require('spectre').open() end },
    },
  },

  {'akinsho/git-conflict.nvim', version = "*", config = true},

  {
    'andweeb/presence.nvim',
    opts = {
      auto_update       = true,
      neovim_image_text = 'Help, How do I quit this thing?',
      main_image        = 'neovim',
    }
  },
}
