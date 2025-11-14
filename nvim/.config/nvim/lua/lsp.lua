vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local keymap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    keymap("K", vim.lsp.buf.hover, "Hover Documentation")
    keymap("<leader>gd", vim.lsp.buf.definition, "Goto Declaration")
    keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    keymap("<leader>rn", vim.lsp.buf.rename, "Rename all references")
    keymap("<leader>sd", vim.diagnostic.open_float, "Open Diagnostic Float")
    keymap("<leader>form", vim.lsp.buf.format, "Format")
  end,
})
