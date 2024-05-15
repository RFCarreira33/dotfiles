return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        formatting.stylua,
        formatting.prettierd,
        formatting.black,
        formatting.nixpkgs_fmt,
        formatting.clang_format,
        diagnostics.write_good,
        diagnostics.djlint,
        diagnostics.golangci_lint,
      },
    })
  end,
}
