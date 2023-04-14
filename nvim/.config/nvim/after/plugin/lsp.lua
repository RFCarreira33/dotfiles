local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer',
  'tsserver',
  'pyright',
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
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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

lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    print('Typescript 🦕🦕🦕');
  end,
  cmd = { 'typescript-language-server', '--stdio' },
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'project=relative',
      jsxAttributeCompletionStyle = 'none'
    }
  }
})

lsp.configure('lua_ls', {
  on_attach = function(client, bufnr)
    print('Lua 🌙🌙🌙');
  end,
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

lsp.configure('pyright', {
  on_attach = function(client, bufnr)
    print('Python 🐍🐍🐍');
  end,
  cmd = { 'pyright-langserver', '--stdio' },
})

lsp.configure('rust_analyzer', {
  on_attach = function(client, bufnr)
    print('Rust 🦀🦀🦀');
  end,
  cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
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
