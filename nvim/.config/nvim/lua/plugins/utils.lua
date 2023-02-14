return {

    -- GIT and copilot
    'github/copilot.vim',
    'lewis6991/gitsigns.nvim',

    -- Navigation
    'christoomey/vim-tmux-navigator',

    -- Markdown previewer
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    --
    -- Find and replace vscode like
    {
        "windwp/nvim-spectre",
        -- stylua: ignore
        keys = {
            { "<leader>rr", function() require("spectre").open() end },
        },
    },

    -- Show discord users that u are superior
    { "andweeb/presence.nvim",
        config = function()
            require("presence").setup({
                auto_update       = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text = "Neovim, Wishing it was VSCode", -- Text displayed when hovered over the Neovim image
                main_image        = "neovim",
            })
        end
    },
}
