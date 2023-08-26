return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },

    -- Rust
    { 'simrat39/rust-tools.nvim' },
  },
  config = function()
    local lsp = require('lsp-zero').preset('recommended')
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

    -- disable tab and s-tab for copilot use
    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.set_sign_icons({
      error = '✘',
      warn = '',
      hint = '⚑',
      info = '󰙎'
    })

    -- Setup server specific configurations
    lsp.skip_server_setup({ 'rust_analyzer', })

    require('rust-tools').setup({
      on_attach = function()
        print('Rust 🦀🦀🦀');
      end,
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    })

    lsp.configure('lua_ls', {
      on_attach = function()
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

    lsp.configure('tsserver', {
      on_attach = function()
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

    lsp.setup()
  end,
}
