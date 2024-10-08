return {
  'machakann/vim-highlightedyank',

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- Fidget shows LSP status updates in bottom right corner
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
    },
  },

  { 'ray-x/guihua.lua' }
}
