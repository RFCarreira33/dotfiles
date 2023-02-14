return {

    --colorscheme meterial
    {
        "marko-cerovac/material.nvim",
        config = function()
            vim.g.material_italic_comments = true
            -- set the style
            vim.g.material_style = "darker"
            vim.cmd("colorscheme material")
        end,
    },

}
