return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local vscode_loader = require("luasnip.loaders.from_vscode")

    -- friendly-snippets
    vscode_loader.lazy_load()

    -- my custom snippets
    local path = vim.fn.stdpath("config") .. "/snippets"
    vscode_loader.lazy_load({ paths = path })

    -- Note: Moved to vscode format. See the 'snippets' folder.
    -- local ls = require("luasnip")
    -- local s = ls.snippet
    -- local t = ls.text_node
    -- local i = ls.insert_node
    -- ls.add_snippets("javascript", {
    --   s("lo", {
    --     t('console.log('), i(1), t(');')
    --   })
    --
    -- });
  end
}
