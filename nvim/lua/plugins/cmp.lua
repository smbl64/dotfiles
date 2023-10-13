local luasnip = require("luasnip")

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- source for neovim's built-in LSP
        'hrsh7th/cmp-nvim-lsp',
        -- source for neovim Lua API
        'hrsh7th/cmp-nvim-lua',
        -- source for displaying function signatures with the current parameter emphasized
        'hrsh7th/cmp-nvim-lsp-signature-help',
        -- source for buffer words
        'hrsh7th/cmp-buffer',
        -- source for filesystem paths
        'hrsh7th/cmp-path',
        -- source for vim's cmdline
        'hrsh7th/cmp-cmdline',
        -- luasnip completion source
        'saadparwaiz1/cmp_luasnip',
    },
    event = { 'BufRead', 'BufNewFile', 'InsertEnter' },
    config = function()
        local cmp = require 'cmp'

        cmp.setup({
            formatting = {
                format = function(entry, vim_item)
                    -- Source
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        buffer = "[Buffer]",
                        nvim_lua = "[Lua]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end
            },
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp" },
                    { name = 'luasnip' },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
                {
                    { name = 'buffer' },
                }
            )
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources(
                {
                    -- You can specify the `cmp_git` source if you were installed it.
                    { name = 'cmp_git' },
                },
                {
                    { name = 'buffer' },
                }
            )
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = 'path' }
                },
                {
                    { name = 'cmdline' }
                }
            )
        })
    end
}
