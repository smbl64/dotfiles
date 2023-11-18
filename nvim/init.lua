-- Disable default mappings set by Vim Mark
vim.g.mw_no_mappings = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup('plugins')

require('me.config')
require('me.keybindings')

local vimrc_local = vim.fn.expand("~/.vimrc_local")
if vim.fn.filereadable(vimrc_local) then
  vim.cmd('source' .. vimrc_local)
end
