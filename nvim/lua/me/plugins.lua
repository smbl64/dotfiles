local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup({
    -- Themes
    'chriskempson/base16-vim',
    'NLKNguyen/papercolor-theme',
    'altercation/vim-colors-solarized',
    'yasukotelin/shirotelin',
    -- Markdown
    'godlygeek/tabular',
    'preservim/vim-markdown',

    -- GUI enhancements
    'machakann/vim-highlightedyank',

    {
        'ibhagwan/fzf-lua',
        -- optional for icon support
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

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
    {
        'NeogitOrg/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        config = true
    },

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
    'ray-x/go.nvim',

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
    },

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    'lukas-reineke/lsp-format.nvim',

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*",
        -- install jsregexp (optional!:).
        build = "make install_jsregexp"
    },

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',

    'j-hui/fidget.nvim',

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

    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',

    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 100,
                    ignore_whitespace = false,
                },
            }
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
})
