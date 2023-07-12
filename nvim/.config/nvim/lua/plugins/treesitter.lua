return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
          "bash",
          "json",
          "lua",
          "rust",
          "toml",
          "regex",
          "tsx",
          "typescript",
          "yaml",
        },
      })
    end,
  },
}
