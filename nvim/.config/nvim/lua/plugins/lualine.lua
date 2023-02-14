return {
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup {
                options = {
                    theme = require("lualine.themes.material"),
                    icons_enabled = true,
                    disabled_filetypes = { "NvimTree" },
                }
            }
        end,
    },

}
