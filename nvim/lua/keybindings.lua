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

-- SHow invisible chars
vim.keymap.set('n', '<Leader>l', ':set list!<cr>')

--function _G.reload_nvim_conf()
--  for name,_ in pairs(package.loaded) do
--    if name:match('^core') or name:match('^lsp') or name:match('^plugins') then
--      package.loaded[name] = nil
--    end
--  end

--  dofile(vim.env.MYVIMRC)
--  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
--end

--vim.keymap.set('n', '<Leader>ev', reload_nvim_conf)
