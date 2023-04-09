local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'chriskempson/base16-vim'
    use 'NLKNguyen/papercolor-theme'
    use 'altercation/vim-colors-solarized'
    use 'yasukotelin/shirotelin'
    -- Markdown
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'

    -- GUI enhancements
    use 'machakann/vim-highlightedyank'

    ---- Justfile
    --use 'NoahTheDuke/vim-just'

    -- Fuzzy finder
    -- use 'junegunn/fzf'
    -- use 'junegunn/fzf.vim'
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use 'mileszs/ack.vim'
    --Plug 'scrooloose/nerdtree'
    use 'terryma/vim-expand-region'
    use 'inkarkat/vim-ingo-library'
    use 'inkarkat/vim-mark'
    use 'dense-analysis/ale'
    use 'Chiel92/vim-autoformat'
    use 'michaeljsmith/vim-indent-object'
    use 'ludovicchabant/vim-gutentags'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --Plug 'jiangmiao/auto-pairs'

    use 'tpope/vim-unimpaired'
    use 'kana/vim-textobj-user'
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- TODO use 'neoclide/coc.nvim', {'branch': 'release'}
    -- Plug 'easymotion/vim-easymotion'
    -- Run tests in any language
    use 'vim-test/vim-test'

    -- Python specific
    use 'bps/vim-textobj-python'
    use 'tmhedberg/SimpylFold'
    use 'vim-scripts/indentpython.vim'
    use 'smbl64/vim-black-macchiato'

    -- use 'rust-lang/rust.vim'
    use 'mrk21/yaml-vim'
    use 'hashivim/vim-terraform'

    use 'lervag/vimtex'

    -- Web development
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use 'hail2u/vim-css3-syntax'
    -- Golang
    -- use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
    use 'ray-x/go.nvim'

    use 'rodjek/vim-puppet'

    -- Lox
    use 'timmyjose-projects/lox.vim'

    -- Dart
    use 'dart-lang/dart-vim-plugin'

    -- Zig
    use 'ziglang/zig.vim'

    -- Allow local vimrc files
    use 'jenterkin/vim-autosource'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    }
    use {
        "nvim-treesitter/playground",
        requires = "nvim-treesitter/nvim-treesitter",
    }

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig'

    use "lukas-reineke/lsp-format.nvim"

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    use 'j-hui/fidget.nvim'

    -- Neovim setup for init.lua and plugin development with full signature help etc
    use "folke/neodev.nvim"

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }

    use 'simrat39/rust-tools.nvim'

    -- Useful plugin to show you pending keybinds.
    use 'folke/which-key.nvim'

    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    use {
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
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- This must be the last thing
    if packer_bootstrap then
        require('packer').sync()
    end
end)
