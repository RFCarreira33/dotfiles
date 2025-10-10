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

  'tomtom/tcomment_vim',

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

  { 'akinsho/git-conflict.nvim', version = "*", config = true },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = false,
      message_template = " <summary> • <date> • <author>",
      date_format = "%m-%d-%Y",
      virtual_text_column = 4,
    },
  },

  {
    "lervag/vimtex",
    lazy = false,
    ft = {"tex", "latex"},
    config = function ()
      local g = vim.g
      g.vimtex_quickfix_mode = 0
      g.vimtex_view_method = 'zathura'
      g.vimtex_view_general_viewer = 'zathura'
    end
  },

  {
    "mason-org/mason.nvim",
    opts = {}
  }
}
