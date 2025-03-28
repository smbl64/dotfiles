-- Disable swap files
vim.o.swapfile = false

-- make backspace behave like normal again
vim.o.backspace = "indent,eol,start"

-- Tab configs
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true

-- To make CursorHold react faster
vim.o.updatetime = 250

-- Leave a little room on top and bottom of the screen when scrolling
vim.o.scrolloff = 3

-- Allow unsaved buffers to go to background
vim.o.hidden = true

-- Search configs
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.autoindent = true
vim.o.number = true
vim.o.cursorline = true

vim.o.backup = false
vim.o.laststatus = 2
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- Have a better :find experience
vim.opt.path:append('**')

-- Open new splits on right or below
vim.o.splitbelow = true
vim.o.splitright = true

-- Automatically re-read the file if it's changed
vim.o.autoread = true

vim.o.timeout = true
vim.o.timeoutlen = 300
-- Better timeouts
-- vim.o.ttimeout = true
-- vim.o.ttimeoutlen = 100
-- vim.o.timeoutlen = 1000

-- netrw configs
vim.g.netrw_banner = 0    -- No help banner
vim.g.netrw_liststyle = 3 -- tree

-- vim-mark config
vim.g.mw_no_mappings = 1

-- vimtex configs
vim.g.tex_flavor = 'latex'          -- Default tex file format
vim.g.vimtex_view_method = 'skim'   -- Choose which program to use to view PDF file
vim.g.vimtex_view_skim_sync = 1     -- forward search after every successful compilation
vim.g.vimtex_view_skim_activate = 1 -- allows change focus to skim after command `:VimtexView`

-- Rust configs
vim.g.rustfmt_autosave = 1

-- Ale configs
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '(ale) [%severity%] %linter%: %s'
vim.g.ale_linters_explicit = 1
vim.g.ale_linters = {
  perl = { 'perlcritic' },
  sh = { 'shellcheck' },
}

-- Always show the signcolumn, otherwise it would shift
-- the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'

-- Auto-pairs config
vim.g.AutoPairsMultilineClose = 0

vim.g.dart_format_on_save = 1

vim.g.formatters_python = { 'black', 'yapf', 'autopep8' }

-- if vim.fn.executable('rg') then
--     vim.g.ackprg = [[rg --fixed-strings --vimgrep --hidden --glob "!.git/"]]
-- end

vim.cmd([[
    " Trim the whitespace
    " https://vi.stackexchange.com/a/456/25216
    fun! TrimTrailingSpaces()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    command! TrimTrailingSpaces call TrimTrailingSpaces()
]])

-- Use space for code folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99

vim.opt.completeopt = "menu,menuone,noinsert"

-- Use OS clipboard
if vim.fn.has('macunix') then
  vim.o.clipboard = 'unnamed'
else
  vim.o.clipboard = 'unnamedplus'
end

-- Disable the welcome message
vim.opt.shortmess:append('I')

-- Turn off the annoying bells
vim.o.belloff = 'all'

-- Permanent undo
vim.o.undodir = vim.fn.stdpath('data') .. '/undo-dir'
vim.o.undofile = true

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme "nightfox"

-- Config for showing invisible chars
vim.o.listchars = 'tab:▸\\ ,eol:¬,space:␣'

local myGroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = myGroup,
  pattern = "*",
  command = "silent! wa"
})



vim.cmd([[
    " Expand %% to current directory (in Ex command mode)
    cabbr <expr> %% expand('%:p:h')

    " Abbreviation for vertical split find
    cabbrev vsf vert sfind
]])

local customftGroup = vim.api.nvim_create_augroup('CustomFileTypes', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    group = customftGroup,
    pattern = '*.xml.j2',
    command = 'set filetype=xml',
  }
)

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufReadPost' },
  {
    group = customftGroup,
    pattern = '*.{yaml,yml}',
    command = 'set filetype=yaml foldmethod=indent',
  }
)

vim.api.nvim_create_autocmd('FileType', {
  group = customftGroup,
  pattern = 'yaml',
  command = 'setlocal ts=2 sts=2 sw=2 expandtab',
})


vim.api.nvim_create_autocmd("FileType", {
  group = customftGroup,
  pattern = "python",
  command = "map <silent> <buffer> <leader>pb oimport pdb; pdb.set_trace()<esc>"
})

-- A hack to navigate yaml files with [[ and ]]
vim.api.nvim_create_autocmd('FileType', {
  group = customftGroup,
  pattern = 'yaml',
  command = [=[ nnoremap <buffer> ]] /^\S<cr>:nohl<cr> ]=]
})
vim.api.nvim_create_autocmd('FileType', {
  group = customftGroup,
  pattern = 'yaml',
  command = [=[ nnoremap <buffer> [[ ?^\S<cr>:nohl<cr> ]=]
})

local bgHighlightGroup = vim.api.nvim_create_augroup('BgHighlight', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
  group = bgHighlightGroup,
  pattern = { '*' },
  command = 'set cursorline',
})

-- Make active window more visible
vim.api.nvim_create_autocmd('WinLeave', {
  group = bgHighlightGroup,
  pattern = { '*' },
  command = 'set nocursorline',
})

require('nvim-treesitter.configs').setup {
  --ensure_isntalled = "all",
  ensure_installed = {
    "go",
    "gomod",
    "gosum",
    "java",
    "json",
    "lua",
    "perl",
    "python",
    "rust",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },

  additional_vim_regex_highlighting = false,
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

require('which-key').setup()
require("lsp-format").setup({
  -- I use go.nvim for formatting. See format_sync_grp in this file.
  go = {
    exclude = { "gopls" }
  }
})

require("me.statusline")
require("me.lsp").setup()


-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})


-- Based on: https://discourse.gohugo.io/t/vim-syntax-highlighting-for-hugo-html-templates/19398/8
-- Detect Hugo template files
local ftDetectGroup = vim.api.nvim_create_augroup('FileTypeDetect', { clear = true })
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  {
    group = ftDetectGroup,
    pattern = "*",
    callback = function()
      if vim.fn.expand("%:e") ~= "html" then
        return
      end

      if vim.fn.search("{{") == 0 then
        return
      end

      vim.o.filetype = "gohtmltmpl"
    end,
  }
)
