return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },

    { 'simrat39/rust-tools.nvim' },
  },
  config = function()
    local lsp = require('lsp-zero').preset('recommended')

    local cmp = require('cmp')
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-a>'] = cmp.mapping.confirm({ select = true }),
      ['<Cr>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
    })

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

    lsp.configure('pyright', {
      on_attach = function()
        print('Python 🐍🐍🐍');
      end,
      cmd = { 'pyright-langserver', '--stdio' },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'workspace',
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
