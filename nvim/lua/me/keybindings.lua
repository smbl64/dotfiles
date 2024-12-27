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
wk.add({

  { "<leader><Space>", "<cmd>noh<cr>",               desc = "Clear search result" },
  { "<leader>l",       group = "list" },
  { "<leader>lb",      "<cmd>FzfLua buffers<cr>",    desc = "Show buffers" },
  { "<leader>lf",      "<cmd>FzfLua files<cr>",      desc = "Find file" },
  { "<leader>lg",      "<cmd>FzfLua live_grep<cr>",  desc = "Live grep" },
  { "<leader>lr",      "<cmd>FzfLua oldfiles<cr>",   desc = "Open recent file",            remap = true },
  { "<leader>q",       "<cmd>q<cr>",                 desc = "Quit buffer" },
  { "<leader>s",       "<cmd>FzfLua grep_cword<cr>", desc = "Search for current word" },
  { "<leader>m",       group = "misc" },
  { "<leader>mh",      "<cmd>set list!<cr>",         desc = "Show hidden chars" },
  { "<leader>mm",      "<Plug>MarkSet",              desc = "Toggle mark on current word", mode = { "n", "x" } },
})


wk.add({
  { "<C-p>", "<cmd>FzfLua files<cr>", desc = "Find file" },
})

wk.add({
  { "<F9>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" },
})

vim.api.nvim_create_autocmd('FileType', {
  group = customftGroup,
  pattern = 'perl',
  callback = function()
    wk.add({
      { "<leader>f", "<plug>(PerlTidyCurrentLine)", desc = "Run perltidy on the current line" },
    })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = customftGroup,
  pattern = 'perl',
  callback = function()
    wk.add({
      { "<leader>f", "<plug>(PerlTidySelection)", desc = "Run perltidy on the selected lines", mode = "x" },
    })
  end,
})

-- TODO
vim.cmd([[
    augroup CustomKeyboardShortcuts
        autocmd!
        autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)
        autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)

        autocmd FileType xml nnoremap <buffer> <Leader>f :%!xmllint --format %<cr>
        autocmd FileType sql nnoremap <buffer> <Leader>f :%!sqlformat --reindent --keywords upper --identifiers lower -<cr>
    augroup END
]])
