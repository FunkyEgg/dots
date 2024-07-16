return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts_extend = { "ensure_installed" },
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
        }
    }
}}
