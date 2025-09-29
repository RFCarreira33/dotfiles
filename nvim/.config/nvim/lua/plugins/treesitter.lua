TREESITTER_LANGS = {
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
  "vue"
}

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
    ensure_installed = TREESITTER_LANGS,
  }
}
