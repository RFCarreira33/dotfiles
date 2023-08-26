return {
  --Colorscheme
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end,
  },

  -- Diferent UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      })
    end
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },

    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'neo-tree', 'lazy', 'alpha' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'fileformat', 'filetype' },
          lualine_y = { 'progress', 'location' },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end
          },
        },
      }
    end,
  },

  -- Buffer line
  'romgrk/barbar.nvim',

  -- Startup Menu
  {
    {
      'goolord/alpha-nvim',
      event = 'VimEnter',
      opts = function()
        local dashboard = require('alpha.themes.dashboard')
        local logo = [[
        ⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠸⣷⣮⣿⣿⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⢀⡠⠒⠉⠀⠀⠀⠀⠀⠀⠈⠁⠲⢖⠒⡀⠀⠀
        ⠀⠀⠀⡠⠴⣏⠀⢀⡀⠀⢀⡀⠀⠀⠀⡀⠀⠀⡀⠱⡈⢄⠀
        ⠀⠀⢠⠁⠀⢸⠐⠁⠀⠄⠀⢸⠀⠀⢎⠀⠂⠀⠈⡄⢡⠀⢣
        ⠀⢀⠂⠀⠀⢸⠈⠢⠤⠤⠐⢁⠄⠒⠢⢁⣂⡐⠊⠀⡄⠀⠸
        ⠀⡘⠀⠀⠀⢸⠀⢠⠐⠒⠈⠀⠀⠀⠀⠀⠀⠈⢆⠜⠀⠀⢸
        ⠀⡇⠀⠀⠀⠀⡗⢺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡄⢀⠎
        ⠀⢃⠀⠀⠀⢀⠃⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠷⡃⠀
        ⠀⠈⠢⣤⠀⠈⠀⠀⠑⠠⠤⣀⣀⣀⣀⣀⡀⠤⠒⠁⠀⢡⠀
        ⡀⣀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠀
        ⠑⢄⠉⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀
        ⠀⠀⠑⠢⢱⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀
        ⠀⠀⠀⠀⢀⠠⠓⠢⠤⣀⣀⡀⠀⠀⣀⣀⡀⠤⠒⠑⢄⠀⠀
        ⠀⠀⠀⠰⠥⠤⢄⢀⡠⠄⡈⡀⠀⠀⣇⣀⠠⢄⠀⠒⠤⠣⠀
        ⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀]]

        dashboard.section.header.val = vim.split(logo, '\n')
        dashboard.section.buttons.val = {
          dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
          dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
          dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
          dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
          button.opts.hl = 'AlphaButtons'
          button.opts.hl_shortcut = 'AlphaShortcut'
        end
        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'AlphaHeader'
        dashboard.section.buttons.opts.hl = 'AlphaButtons'
        dashboard.opts.layout[1].val = 8
        return dashboard
      end,
      config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == 'lazy' then
          vim.cmd.close()
          vim.api.nvim_create_autocmd('User', {
            pattern = 'AlphaReady',
            callback = function()
              require('lazy').show()
            end,
          })
        end

        require('alpha').setup(dashboard.opts)
        vim.api.nvim_create_autocmd('User', {
          pattern = 'LazyVimStarted',
          callback = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = '⚡ Neovim loaded ' ..
                stats.count .. ' plugins in ' .. ms .. 'ms'
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
  },
}
