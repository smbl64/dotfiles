return {
    -- Markdown
    'godlygeek/tabular',
    'preservim/vim-markdown',

    'mileszs/ack.vim',
    'terryma/vim-expand-region',
    'inkarkat/vim-ingo-library',
    'inkarkat/vim-mark',
    'dense-analysis/ale',
    'Chiel92/vim-autoformat',
    'michaeljsmith/vim-indent-object',
    'ludovicchabant/vim-gutentags',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    --Plug 'jiangmiao/auto-pairs'

    'tpope/vim-unimpaired',
    'kana/vim-textobj-user',
    'tpope/vim-fugitive',

    -- Run tests in any language
    'vim-test/vim-test',

    -- Python specific
    'bps/vim-textobj-python',
    'tmhedberg/SimpylFold',
    'vim-scripts/indentpython.vim',
    'smbl64/vim-black-macchiato',

    -- 'rust-lang/rust.vim',
    'mrk21/yaml-vim',
    'hashivim/vim-terraform',

    'lervag/vimtex',

    -- Web development
    'pangloss/vim-javascript',
    'maxmellon/vim-jsx-pretty',
    'hail2u/vim-css3-syntax',

    -- Golang
    {
        'ray-x/go.nvim',
        -- Noted: Fixed on this commit until the problem with
        -- goimports get fixed
        -- commit = '44bd0589ad22e2bb91f2ed75624c4a3bab0e5f59',
        config = true,
    },

    'rodjek/vim-puppet',

    -- Lox
    'timmyjose-projects/lox.vim',

    -- Dart
    'dart-lang/dart-vim-plugin',

    -- Zig
    'ziglang/zig.vim',

    -- Allow local vimrc files
    'jenterkin/vim-autosource',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = 'TSPlaygroundToggle'
    },

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    'lukas-reineke/lsp-format.nvim',

    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local vscode_loader = require("luasnip.loaders.from_vscode")

            -- friendly-snippets
            vscode_loader.lazy_load()

            -- my custom snippets
            local path = vim.fn.stdpath "config" .. "/snippets"
            vscode_loader.lazy_load({ paths = path })
        end
    },

    -- Neovim setup for init.lua and plugin development with full signature help etc
    'folke/neodev.nvim',

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        }
    },

    'simrat39/rust-tools.nvim',

    'folke/which-key.nvim',

    {
        "NoahTheDuke/vim-just",
        event = { "BufReadPre", "BufNewFile" },
        ft = { "\\cjustfile", "*.just", ".justfile" },
    }
}
