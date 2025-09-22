local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
  -- Read the first line of the file
  local f = io.open(file, "r")
  local first_line = f and f:read("*l") or ""
  if f then
    f:close()
  end
  -- Only include the file if it doesn't start with "-- disable"
  if not first_line:match("^%-%- disable") then
    local name = vim.fn.fnamemodify(file, ":t:r")     -- `:t` gets filename, `:r` removes extension
    table.insert(lsp_files, name)
  end
end

vim.lsp.enable(lsp_files)

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
