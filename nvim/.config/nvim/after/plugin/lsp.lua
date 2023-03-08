local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer'
})

-- require cmp to remap
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- map <CR> to confirm
    ['<C-a>'] = cmp.mapping.confirm({ select = true }),
    ['<Cr>'] = cmp.mapping.confirm({ select = true }),
    -- map <C-e> to close menu
    ['<C-e>'] = cmp.mapping.close(),
    -- map <C-f> to scroll down
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- map <C-d> to scroll up
    ['<C-d>'] = cmp.mapping.scroll_docs( -4),
    -- map <C-j> to select next item
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- map <C-k> to select previous item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
})

-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


lsp.configure('rust_analyzer', {
  on_attach = function(client, bufnr)
    print('Rust 🦀🦀🦀');
  end,
  cmd = { 'rustup', 'run' ,'stable', 'rust-analyzer' },
})

lsp.setup()


-- inline diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
