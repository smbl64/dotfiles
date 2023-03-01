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
vim.g.netrw_banner = 0  -- No help banner
vim.g.netrw_liststyle = 3  -- tree

-- vim-go configs
vim.g.go_template_autocreate = 0
vim.g.go_def_mapping_enabled = 0
vim.g.go_fmt_command = "gopls"
vim.g.go_imports_mode = "gopls"
vim.g.go_gopls_gofumpt = 1
vim.g.go_doc_keywordprg_enabled = 0  -- Disable K keybinding (GoDoc)

-- vim-mark config
vim.g.mw_no_mappings = 1

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
    ['python'] = {'flake8'},
    ['rust'] = {},
    ['go'] = {},
}
vim.g.ale_linters_ignore = {
    ['rust'] = {'rls', 'rustc'}
}

-- Always show the signcolumn, otherwise it would shift
-- the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'

-- Auto-pairs config
vim.g.AutoPairsMultilineClose = 0

vim.g.dart_format_on_save = 1


-- TODO
vim.cmd([[
    augroup CustomKeyboardShortcuts
        autocmd!
        autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)
        autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)

        autocmd FileType perl xmap <buffer> <Leader>f <plug>(PerlTidySelection)
        autocmd FileType perl nmap <buffer> <Leader>f <plug>(PerlTidyCurrentLine)


        autocmd FileType xml nnoremap <buffer> <Leader>f :%!xmllint --format %<cr>
        autocmd FileType sql nnoremap <buffer> <Leader>f :%!sqlformat --reindent --keywords upper --identifiers lower -<cr>
    augroup END
]])

vim.g.formatters_python = { 'black', 'yapf', 'autopep8' }

-- Use 'ripgrep' or 'ag' for ack plugin
-- Both are configured to check for literal strings (so, no regex)
if vim.fn.executable('rg') then
  vim.g.ackprg = [[rg --fixed-strings --vimgrep --hidden --glob "!.git/"]]
else
  vim.g.ackprg = [[ag --literal --vimgrep]]
end


-- TODO
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
vim.cmd.colorscheme "base16-gruvbox-dark-hard"

-- Config for showing invisible chars
vim.o.listchars = 'tab:▸\\ ,eol:¬,space:␣'


vim.cmd([[
    augroup MyGroup
        autocmd!
        autocmd FocusLost * silent! wa

        " Python specific
        autocmd FileType python map <silent> <buffer>
                    \ <leader>pb oimport pdb; pdb.set_trace()<esc>

    augroup END

    " Show list of all files or buffers using fzf
    nnoremap <leader>b <cmd>FzfLua buffers<CR>
    nnoremap <C-p> <cmd>FzfLua files<CR>

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
    pattern = 'yaml',
    command = 'setlocal ts=2 sts=2 sw=2 expandtab',
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
    pattern = {'*'},
    command = 'set cursorline',
})

-- Make active window more visible
vim.api.nvim_create_autocmd('WinLeave', {
    group = bgHighlightGroup,
    pattern = {'*'},
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
require("mason").setup()
require("mason-lspconfig").setup()

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
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

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()


local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp = require('lspconfig')

lsp.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.lua_ls.setup{
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
            globals = {'vim'},
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
lsp.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

lsp.jdtls.setup{
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
require'fidget'.setup{}

-- Smart and powerful comment plugin for neovim
require('Comment').setup()

require('which-key').setup()

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
    end,
  },
})

require('fzf-lua').setup()
