-- Disable arrow keys
vim.keymap.set({'n', 'i', 'v'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Right>', '<Nop>')

-- Easier movement within windows
vim.keymap.set({'n', 'o', 'v'}, '<c-j>', '<c-w>j')
vim.keymap.set({'n', 'o', 'v'}, '<c-k>', '<c-w>k')
vim.keymap.set({'n', 'o', 'v'}, '<c-l>', '<c-w>l')
vim.keymap.set({'n', 'o', 'v'}, '<c-h>', '<c-w>h')

-- Use standard regex for searching (via '\V' option)
vim.keymap.set({'n', 'v'}, '/', '/\\V')


vim.keymap.set({'n', 'x'}, '<Leader>m', '<Plug>MarkSet')

-- Easily quit buffers
vim.keymap.set('n', '<Leader>q', ':q<cr>')

-- Show invisible chars
vim.keymap.set('n', '<Leader>l', ':set list!<cr>')

-- Grep the word under cursor
vim.keymap.set('n', '<Leader>s', '<cmd>FzfLua grep_cword<cr>')

-- Clean the search result by hitting space
vim.keymap.set('n', '<Leader><Space>', '<cmd>noh<cr>')

