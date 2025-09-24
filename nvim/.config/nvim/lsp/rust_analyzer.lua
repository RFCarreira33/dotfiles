return {
  filetypes = { "rust" },
  cmd = { "rust-analyzer" },
  workspace_required = true,
  settings = {
    autoformat = false,
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
}
