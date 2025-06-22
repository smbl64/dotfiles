local M = {}

function M.setup()
  -- Order is important:
  --  1. mason.nvim
  --  2. mason-lspconfig.nvim
  --  3. Setup servers via lspconfig
  require("mason").setup({
    PATH = "append", -- prioritize system-wide LSPs
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
  require("mason-lspconfig").setup({
    -- Make sure servers that are configured with lspconfig are installed.
    automatic_installation = true,
  })

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
    local wk_opts = { buffer = bufnr, silent = true };

    -- Note: keep wk.register calls for now to make sure all works properly. I will remove them later.
    -- wk.register({ c = { name = "code actions (lsp)" } }, wk_opts)
    wk.add({ { "<leader>c", buffer = 1, group = "code actions (lsp)" }, })
    -- wk.register({ w = { name = "workspace" } }, wk_opts)
    wk.add({ { "<leader>w", buffer = 1, group = "workspace" }, })

    -- wk.register({
    --   l = {
    --     s = {
    --       name = "symbols",
    --       d = { "<cmd>FzfLua lsp_document_symbols<cr>", "Show document symbols (LSP)" },
    --       r = { "<cmd>FzfLua lsp_references<cr>", "Show references (LSP)" },
    --       w = { "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Show workspace symbols (LSP)" },
    --     }
    --   }
    -- }, wk_opts)

    wk.add({
      { "<leader>ls",  buffer = 1,                                   group = "symbols" },
      { "<leader>lsd", "<cmd>FzfLua lsp_document_symbols<cr>",       buffer = 1,       desc = "Show document symbols (LSP)" },
      { "<leader>lsr", "<cmd>FzfLua lsp_references<cr>",             buffer = 1,       desc = "Show references (LSP)" },
      { "<leader>lsw", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", buffer = 1,       desc = "Show workspace symbols (LSP)" },
    })

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
    vim.keymap.set('n', '<Leader>d', function()
      local opts = {
        focusable = false,
        border = 'rounded',
        source = 'always',
        prefix = '',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end, make_opts("Show diagnostics under cursor"))
  end

  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  local servers = {
    'arduino_language_server',
    'clangd',
    'cssls',
    gopls = {
      gopls = {
        hints = {
          assignVariableTypes = false,
          compositeLiteralFields = false,
          compositeLiteralTypes = false,
          constantValues = false,
          functionTypeParameters = false,
          parameterNames = false,
          rangeVariableTypes = false,
        },
      },
    },
    'html',
    'jdtls',
    lua_ls = {
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
    'pyright',
    'rust_analyzer',
    'solargraph',
    'starpls',
    'templ',
    'terraformls',
    'ts_ls',
    'vue_ls',
    'yamlls',
    'zls',
  }

  -- Custom "Settings" for any of the servers above
  -- Keys must match the LSP name (e.g. "rust_analyzer"), and the value is
  -- what you would like to assign to "settings".

  for lsp_name, body in pairs(servers) do
    local settings

    if type(lsp_name) == 'number' then
      -- No config specified; only the name
      lsp_name = body
      settings = {}
    else
      settings = body
    end

    -- mason-lspconfig already enables all installed LSP servers. I just do it
    -- again for completeness :)
    vim.lsp.enable(lsp_name)
    vim.lsp.config(lsp_name, {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = settings,
    })
  end

  require("rust-tools").setup({
    server = {
      on_attach = on_attach
    },
  })
end

return M
