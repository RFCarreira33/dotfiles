return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    highlight = { enable = true, },
    indent = { enable = true },
    autotag = { enable = true },
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
    auto_install = true,
  }
}
