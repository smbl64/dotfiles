return {
    'chriskempson/base16-vim',
    'NLKNguyen/papercolor-theme',
    'altercation/vim-colors-solarized',
    'yasukotelin/shirotelin',

    'machakann/vim-highlightedyank',

    -- Fidget shows LSP status updates in bottom right corner
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
        },
    }
}
