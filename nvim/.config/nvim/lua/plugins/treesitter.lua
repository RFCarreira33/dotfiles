return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
      "c",
      "help",
      "lua",
      "vim",
      "python",
      "json",
      "typescript",
      "javascript",
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
      "rust",
      "php",
      "vue",
      "sql",
      "java"
    },
  }
}
