return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_hidden = true,

                    always_show = { ".gitignore" },
                },
            },
        })

        vim.keymap.set("n", "<Leader>nt", ":Neotree toggle<CR>")
        vim.keymap.set("n", "<Leader>nf", ":Neotree<CR>")
    end
}
