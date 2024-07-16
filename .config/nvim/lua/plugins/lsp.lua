return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',

            { "L3MON4D3/LuaSnip", version = "v2.*" },
            "saadparwaiz1/cmp_luasnip",
        },

        lazy = false,

        config = function ()
            local lsp = require("lspconfig")
            local cmp = require("cmp")

            cmp.setup({
                snippet = { expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,},

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),

                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-Space>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
            })

            local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            lsp.clangd.setup({
                capabilities = cmp_capabilities,
                cmd = {
                    "clangd",
                    "--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--header-insertion=never",
                }
            })

            lsp.hls.setup({ capabilities = cmp_capabilities })
        end
    }
}
