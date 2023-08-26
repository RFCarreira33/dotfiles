return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- configure treesitter
    require("nvim-treesitter.configs").setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "typescript",
        "tsx",
        "html",
        "css",
        "lua",
        "gitignore",
        "vim",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
      },
      -- auto install above language parsers
      auto_install = true,
    })
  end,
}
