require('me.plugins')
require('me.config')
require('me.keybindings')

local vimrc_local = vim.fn.expand("~/.vimrc_local")
if vim.fn.filereadable(vimrc_local) then
    vim.cmd('source' .. vimrc_local)
end
