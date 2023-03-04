-- Disable arrow keys
vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<Nop>')

-- Easier movement within windows
vim.keymap.set({ 'n', 'o', 'v' }, '<c-j>', '<c-w>j')
vim.keymap.set({ 'n', 'o', 'v' }, '<c-k>', '<c-w>k')
vim.keymap.set({ 'n', 'o', 'v' }, '<c-l>', '<c-w>l')
vim.keymap.set({ 'n', 'o', 'v' }, '<c-h>', '<c-w>h')

-- Use standard regex for searching (via '\V' option)
vim.keymap.set({ 'n', 'v' }, '/', '/\\V')

local wk = require('which-key')
wk.register({
    ["<Space>"] = { "<cmd>noh<cr>", "Clear search result" },
    l = {
        name = "list",
        f = { "<cmd>FzfLua files<cr>", "Find file" },
        r = { "<cmd>FzfLua oldfiles<cr>", "Open recent file", noremap = false },
        b = { "<cmd>FzfLua buffers<cr>", "Show buffers" },
    },
    q = { "<cmd>q<cr>", "Quit buffer" },
    s = { "<cmd>FzfLua grep_cword<cr>", "Search for current word" },
    x = {
        name = "misc",
        h = { "<cmd>set list!<cr>", "Show hidden chars" },
        m = { "<Plug>MarkSet", "Toggle mark on current word", mode = { "n", "x" } },
    },
}, { prefix = "<leader>" })


wk.register({
    ["<C-p>"] = { "<cmd>FzfLua files<cr>", "Find file" },
})
