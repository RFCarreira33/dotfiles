return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = {
      preset = "default",
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Cr>'] = { 'select_and_accept', 'fallback' },
      ['<C-a>'] = { 'select_and_accept', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
