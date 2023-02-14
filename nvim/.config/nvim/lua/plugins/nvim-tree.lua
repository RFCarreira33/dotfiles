return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1 -- disable netrw
        vim.g.loaded_netrwPlugin = 1 -- disable netrw
        require("nvim-tree").setup()
    end
}
