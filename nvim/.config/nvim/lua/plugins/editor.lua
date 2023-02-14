return {
    -- Buffer line
    {
        "romgrk/barbar.nvim"
    },

    -- blankline indent
    {
        {
            "lukas-reineke/indent-blankline.nvim",
            event = { "BufReadPost", "BufNewFile" },
            opts = {
                char = "│",
                filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "lazy" },
                show_trailing_blankline_indent = false,
                show_current_context = false,
            },
        },
    },

    -- fast commenting
    'tpope/vim-commentary',

    -- brackets auto pair
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    --change surround real fast
    'tpope/vim-surround',

}
