return {
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    },
    config = function()
      require("java").setup()
      require('lspconfig').jdtls.setup({})
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      local keymap = vim.keymap.set

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
        keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
        keymap("n", "<leader>sd", function() vim.diagnostic.open_float() end, opts)
        keymap("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls' },
        handlers = {
          lsp_zero.default_setup,
        }
      })

      lsp_zero.setup_servers({ 'tsserver', 'rust_analyzer', 'lua_ls' })

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer',  keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-a>'] = cmp.mapping.confirm({ select = true }),
          ['<Cr>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<Tab>'] = nil,
          ['<S-Tab>'] = nil,
        }),
      })

      lspconfig.tsserver.setup({
        single_file_support = false,
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = true
        end,
      })
    end
  }
}
