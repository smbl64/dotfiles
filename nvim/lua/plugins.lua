local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
    use {'junegunn/fzf', run = 'cd ~/.fzf && ./install --all' }
    use 'junegunn/fzf.vim'

    use 'mileszs/ack.vim'
    --Plug 'scrooloose/nerdtree'
    use 'scrooloose/nerdcommenter'
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
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'kana/vim-textobj-user'

    -- TODO use 'neoclide/coc.nvim', {'branch': 'release'}
    -- Plug 'easymotion/vim-easymotion'
    -- Run tests in any language
    use 'vim-test/vim-test'

    -- Python specific
    use 'bps/vim-textobj-python'
    use 'tmhedberg/SimpylFold'
    use 'vim-scripts/indentpython.vim'
    use 'smbl64/vim-black-macchiato'

    use 'rust-lang/rust.vim'
    use 'mrk21/yaml-vim'
    use 'hashivim/vim-terraform'

    -- Web development
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use 'hail2u/vim-css3-syntax'
    -- Golang
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

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

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig'

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    use 'hrsh7th/cmp-nvim-lsp'
	use "hrsh7th/cmp-nvim-lsp-signature-help"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/nvim-cmp'

    use 'j-hui/fidget.nvim'

    -- A library of Lua functions
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }

    -- This must be the last thing
    if packer_bootstrap then
        require('packer').sync()
    end
end)
