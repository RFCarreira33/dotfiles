return {

  -- GIT and copilot
  'github/copilot.vim',
  'lewis6991/gitsigns.nvim',

  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup({
        default_mappings = {
          ours = 'c',
          theirs = 'i',
          none = '0',
          both = 'b',
          next = 'n',
          prev = 'N',
        },
      })
    end
  },

  -- Navigation
  'christoomey/vim-tmux-navigator',

  -- Markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Find and replace vscode like
  {
    "windwp/nvim-spectre",
    keys = {
      { "<leader>fr", function() require("spectre").open() end },
    },
  },

  -- Show discord users that u are superior
  { "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        auto_update       = true,
        neovim_image_text = "Help, How do I quit this thing?",
        main_image        = "neovim",
      })
    end
  },
}
