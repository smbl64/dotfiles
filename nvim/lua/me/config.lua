-- Disable swap files
vim.o.swapfile = false

-- make backspace behave like normal again
vim.o.backspace = "indent,eol,start"

vim.g.mapleader = " "

-- Tab configs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true

-- Leave a little room on top and bottom of the screen when scrolling
vim.o.scrolloff = 3

-- Allow unsaved buffers to go to background
vim.o.hidden = true

-- Search configs
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.autoindent = true
vim.o.number = true
vim.o.cursorline = true

vim.o.backup = false
vim.o.laststatus = 2
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- Have a better :find experience
vim.opt.path:append('**')
vim.opt.wildignore:append('*.pyc')
vim.opt.wildignore:append('*./__pycache__/*')

-- Open new splits on right or below
vim.o.splitbelow = true
vim.o.splitright = true

-- Automatically re-read the file if it's changed
vim.o.autoread = true

vim.o.timeout = true
vim.o.timeoutlen = 300
-- Better timeouts
-- vim.o.ttimeout = true
-- vim.o.ttimeoutlen = 100
-- vim.o.timeoutlen = 1000

-- netrw configs
vim.g.netrw_banner = 0    -- No help banner
vim.g.netrw_liststyle = 3 -- tree

-- vim-go configs
vim.g.go_template_autocreate = 0
vim.g.go_def_mapping_enabled = 0
vim.g.go_fmt_command = "gopls"
vim.g.go_imports_mode = "gopls"
vim.g.go_gopls_gofumpt = 1
vim.g.go_doc_keywordprg_enabled = 0 -- Disable K keybinding (GoDoc)

-- vim-mark config
vim.g.mw_no_mappings = 1

-- vimtex configs
vim.g.tex_flavor = 'latex'          -- Default tex file format
vim.g.vimtex_view_method = 'skim'   -- Choose which program to use to view PDF file
vim.g.vimtex_view_skim_sync = 1     -- forward search after every successful compilation
vim.g.vimtex_view_skim_activate = 1 -- allows change focus to skim after command `:VimtexView`

-- Rust configs
vim.g.rustfmt_autosave = 1

-- Ale configs
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = 'ale: [%linter%] [%severity%] %s'


-- ALE linters. Rust linters are disabled, because they interfere with CoC's analysis.
-- This is what was there before:
-- \ 'rust': ['analyzer', 'cargo', 'rls', 'rustc']
vim.g.ale_linters = {
    ['python'] = { 'flake8' },
    ['rust'] = {},
    ['go'] = {},
}
vim.g.ale_linters_ignore = {
    ['rust'] = { 'rls', 'rustc' }
}

-- Always show the signcolumn, otherwise it would shift
-- the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'

-- Auto-pairs config
vim.g.AutoPairsMultilineClose = 0

vim.g.dart_format_on_save = 1

vim.g.formatters_python = { 'black', 'yapf', 'autopep8' }

if vim.fn.executable('rg') then
    vim.g.ackprg = [[rg --fixed-strings --vimgrep --hidden --glob "!.git/"]]
end

vim.cmd([[
    " Trim the whitespace
    " https://vi.stackexchange.com/a/456/25216
    fun! TrimTrailingSpaces()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    command! TrimTrailingSpaces call TrimTrailingSpaces()
]])

-- Use space for code folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99

vim.opt.completeopt = "menu,menuone,noinsert"

-- Use OS clipboard
if vim.fn.has('macunix') then
    vim.o.clipboard = 'unnamed'
else
    vim.o.clipboard = 'unnamedplus'
end

-- Disable the welcome message
vim.opt.shortmess:append('I')

-- Turn off the annoying bells
vim.o.belloff = 'all'

-- Permanent undo
vim.o.undodir = vim.fn.expand('~') .. '/.config/nvim/undo-dir'
vim.o.undofile = true

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme "base16-decaf"

-- Config for showing invisible chars
vim.o.listchars = 'tab:▸\\ ,eol:¬,space:␣'

local myGroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
    group = myGroup,
    pattern = "*",
    command = "silent! wa"
})



vim.cmd([[
    " Expand %% to current directory (in Ex command mode)
    cabbr <expr> %% expand('%:p:h')

    " Abbreviation for vertical split find
    cabbrev vsf vert sfind
]])

local customftGroup = vim.api.nvim_create_augroup('CustomFileTypes', { clear = true })
vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufRead' },
    {
        group = customftGroup,
        pattern = '*.xml.j2',
        command = 'set filetype=xml',
    }
)

vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufReadPost' },
    {
        group = customftGroup,
        pattern = '*.{yaml,yml}',
        command = 'set filetype=yaml foldmethod=indent',
    }
)

vim.api.nvim_create_autocmd('FileType', {
    group = customftGroup,
    pattern = 'yaml',
    command = 'setlocal ts=2 sts=2 sw=2 expandtab',
})


vim.api.nvim_create_autocmd("FileType", {
    group = customftGroup,
    pattern = "python",
    command = "map <silent> <buffer> <leader>pb oimport pdb; pdb.set_trace()<esc>"
})

-- A hack to navigate yaml files with [[ and ]]
vim.api.nvim_create_autocmd('FileType', {
    group = customftGroup,
    pattern = 'yaml',
    command = [=[ nnoremap <buffer> ]] /^\S<cr>:nohl<cr> ]=]
})
vim.api.nvim_create_autocmd('FileType', {
    group = customftGroup,
    pattern = 'yaml',
    command = [=[ nnoremap <buffer> [[ ?^\S<cr>:nohl<cr> ]=]
})

local bgHighlightGroup = vim.api.nvim_create_augroup('BgHighlight', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
    group = bgHighlightGroup,
    pattern = { '*' },
    command = 'set cursorline',
})

-- Make active window more visible
vim.api.nvim_create_autocmd('WinLeave', {
    group = bgHighlightGroup,
    pattern = { '*' },
    command = 'set nocursorline',
})

require('nvim-treesitter.configs').setup {
    --ensure_isntalled = "all",
    ensure_installed = { "yaml", "json", "rust", "vim", "lua", "help" },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },

    additional_vim_regex_highlighting = false,
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"


-- Order is important:
--  1. mason.nvim
--  2. mason-lspconfig.nvim
--  3. Setup servers via lspconfig
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = 'luasnip' },
        { name = 'conjure' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
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
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

require("lsp-format").setup {}
require('which-key').setup()

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap=true, silent=true, desc="Open diagnostics" })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap=true, silent=true, desc="Go to previous diagnostic" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap=true, silent=true, desc="Go to next diagnostic" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client)

    if client.server_capabilities.completionProvider then
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.bo[bufnr].completefunc = "v:lua.vim.lsp.omnifunc"
    end

    if client.server_capabilities.definitionProvider then
        vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
    end

    local wk = require('which-key')
    local wk_opts = { prefix = "<leader>", buffer = bufnr, silent = true };

    wk.register({ c = { name = "code actions (lsp)" } }, wk_opts)
    wk.register({ w = { name = "workspace" } }, wk_opts)
    wk.register({
        l = {
            s = {
                name = "symbols",
                d = { "<cmd>FzfLua lsp_document_symbols<cr>", "Show document symbols (LSP)" },
                w = { "<cmd>FzfLua lsp_workspace_symbols<cr>", "Show workspace symbols (LSP)" },
            }
        }
    }, wk_opts)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local function make_opts(desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = desc }
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, make_opts("Go to declaration"))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, make_opts("Go to definition"))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, make_opts("Hover"))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, make_opts("Go to implementation"))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, make_opts("Show signature help"))
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, make_opts("Add workspace folder"))
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, make_opts("Remove workspace folder"))
    vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        make_opts("List workspace folders")
    )
    vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename, make_opts("Rename identifier"))
    vim.keymap.set('n', '<Leader>cc', vim.lsp.buf.code_action, make_opts("Show code actions"))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, make_opts("Go to references"))
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, make_opts("Format buffer"))
end

-- MUST be before lspconfig
require("neodev").setup({})

local lsp = require('lspconfig')

lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}

-- Haskell
lsp.hls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- OCaml
lsp.ocamllsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.zls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

--require('lspconfig').perlpls.setup{
--    capabilities = capabilities,
--}

vim.cmd([[
    set statusline=
    set statusline+=%#CursorIM#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#Search#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
    set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    set statusline+=%#Visual#                " colour
    set statusline+=%{&paste?'\ PASTE\ ':''}
    set statusline+=%{&spell?'\ SPELL\ ':''}
    set statusline+=%#CursorIM#              " colour
    set statusline+=%R                       " readonly flag
    set statusline+=%M                       " modified [+] flag
    set statusline+=%#CursorLine#            " colour
    set statusline+=\ %f\                    " short file name
    set statusline+=%=                       " right align
    set statusline+=%#CursorLine#            " colour
    set statusline+=\ %y\                    " file type
    set statusline+=%#CursorIM#              " colour
    "set statusline+=%{coc#status()}
    set statusline+=%#CursorIM#              " colour
    set statusline+=\ %3l:%-2c\              " line + column
    set statusline+=%#CursorIM#              " colour
    set statusline+=\ %3p%%\                 " percentage
]])


-- Fidget shows LSP status updates in bottom right corner
require 'fidget'.setup {}

-- Smart and powerful comment plugin for neovim
require('Comment').setup()

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = on_attach
    },
})

require('fzf-lua').setup({
    global_git_icons = false, -- makes it slow on large projects
})
require('neogit').setup()
require('go').setup()
