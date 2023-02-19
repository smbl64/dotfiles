require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'chriskempson/base16-vim'
    use 'NLKNguyen/papercolor-theme'
    use 'altercation/vim-colors-solarized'
    use 'yasukotelin/shirotelin'
    -- Markdown
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'

    -- GUI enhancements
    use 'machakann/vim-highlightedyank'

    -- Justfile
    use 'NoahTheDuke/vim-just'

    -- Fuzzy finder
    use {'junegunn/fzf', run = 'cd ~/.fzf && ./install --all' }
    use 'junegunn/fzf.vim'

    use 'mileszs/ack.vim'
    --Plug 'scrooloose/nerdtree'
    use 'scrooloose/nerdcommenter'
    use 'terryma/vim-expand-region'
    use 'inkarkat/vim-ingo-library'
    use 'inkarkat/vim-mark'
    use 'dense-analysis/ale'
    use 'Chiel92/vim-autoformat'
    use 'michaeljsmith/vim-indent-object'
    use 'ludovicchabant/vim-gutentags'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --Plug 'jiangmiao/auto-pairs'

    use 'tpope/vim-unimpaired'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'kana/vim-textobj-user'

    -- TODO use 'neoclide/coc.nvim', {'branch': 'release'}
    -- Plug 'easymotion/vim-easymotion'
    -- Run tests in any language
    use 'vim-test/vim-test'

    -- Python specific
    use 'bps/vim-textobj-python'
    use 'tmhedberg/SimpylFold'
    use 'vim-scripts/indentpython.vim'
    use 'smbl64/vim-black-macchiato'

    use 'rust-lang/rust.vim'
    use 'mrk21/yaml-vim'
    use 'hashivim/vim-terraform'

    -- Snippet engine
    use 'MarcWeber/vim-addon-mw-utils'
    use 'tomtom/tlib_vim'
    use 'garbas/vim-snipmate'
    use 'honza/vim-snippets'

    -- Web development
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use 'hail2u/vim-css3-syntax'
    -- Golang
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    use 'rodjek/vim-puppet'

    -- Lox
    use 'timmyjose-projects/lox.vim'

    -- Dart
    use 'dart-lang/dart-vim-plugin'

    -- Zig
    use 'ziglang/zig.vim'

    -- Allow local vimrc files
    use 'jenterkin/vim-autosource'
end)

-- TODO Automatic reloading of .vimrc
vim.cmd([[
    autocmd! bufwritepost .vimrc source %
    autocmd! bufwritepost vimrc source %
]])

-- Disable swap files
vim.o.swapfile = false

-- make backspace behave like normal again
vim.o.backspace = 2

vim.g.mapleader = " "

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

-- Tab configs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true

-- Leave a little room on top and bottom of the screen when scrolling
vim.o.scrolloff = 3

-- Allow unsaved buffers to go to background
vim.o.hidden = true

-- Use standard regex for searching (via '\V' option)
vim.keymap.set({'n', 'v'}, '/', '/\\V')

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
vim.opt.wildignore:append('*.pyc')
vim.opt.wildignore:append('*./__pycache__/*')

-- Open new splits on right or below
vim.o.splitbelow = true
vim.o.splitright = true

-- Automatically re-read the file if it's changed
vim.o.autoread = true

-- Better timeouts
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100
vim.o.timeoutlen = 1000

-- netrw configs
vim.g.netrw_banner = 0  -- No help banner
vim.g.netrw_liststyle = 3  -- tree

-- UltiSnip configs
vim.g.UltiSnipsExpandTrigger = "<s-tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

-- vim-go configs
vim.g.go_template_autocreate = 0
vim.g.go_def_mapping_enabled = 0
vim.g.go_fmt_command = "gopls"
vim.g.go_imports_mode = "gopls"
vim.g.go_gopls_gofumpt = 1
vim.g.go_doc_keywordprg_enabled = 0  -- Disable K keybinding (GoDoc)

-- vim-mark config
vim.g.mw_no_mappings = 1
vim.keymap.set({'n', 'x'}, '<Leader>m', '<Plug>MarkSet')

-- Rust configs
vim.g.rustfmt_autosave = 1

-- Ale configs
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = 'ale: [%linter%] [%severity%] %s'


-- ALE linters. Rust linters are disabled, because they interfere with CoC's analysis.
-- This is what was there before:
-- \ 'rust': ['analyzer', 'cargo', 'rls', 'rustc']
vim.g.ale_linters = {
    ['python'] = {'flake8'},
    ['rust'] = {},
    ['go'] = {},
}
vim.g.ale_linters_ignore = {
    ['rust'] = {'rls', 'rustc'}
}

vim.g.snipMate = { ['snippet_version'] = 1 }

-- TODO: <<<<<<<<< CoC configs were here
--

-- Always show the signcolumn, otherwise it would shift
-- the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'

-- Auto-pairs config
vim.g.AutoPairsMultilineClose = 0

vim.g.dart_format_on_save = 1


-- TODO
vim.cmd([[
    augroup CustomKeyboardShortcuts
        autocmd!
        autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)
        autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)

        autocmd FileType perl xmap <buffer> <Leader>f <plug>(PerlTidySelection)
        autocmd FileType perl nmap <buffer> <Leader>f <plug>(PerlTidyCurrentLine)


        autocmd FileType xml nnoremap <buffer> <Leader>f :%!xmllint --format %<cr>
        autocmd FileType sql nnoremap <buffer> <Leader>f :%!sqlformat --reindent --keywords upper --identifiers lower -<cr>
    augroup END
]])

vim.g.formatters_python = { 'black', 'yapf', 'autopep8' }

-- Use 'ripgrep' or 'ag' for ack plugin
-- Both are configured to check for literal strings (so, no regex)
if vim.fn.executable('rg') then
  vim.g.ackprg = [[rg --fixed-strings --vimgrep --hidden --glob "!.git/"]]
else
  vim.g.ackprg = [[ag --literal --vimgrep]]
end


-- TODO
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


-- Easily quit buffers
vim.keymap.set('n', '<Leader>q', ':q<cr>')

vim.cmd([[
" Ack the current word
noremap <Leader>s :execute('Ack! ' . expand('<cword>'))<cr>
]])

vim.cmd([[
    " Read help for the word under the cursor (vim files)
    augroup VimFiles
        autocmd!
        autocmd FileType vim nnoremap <buffer> <Leader>h :execute "help " . expand("<cword>")<cr>
    augroup END

    " clean the search result by hitting space
    nnoremap <silent> <leader><space> :noh<cr>

    " open vimrc fast!
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
]])


-- Use space for code folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99

-- Shorter update time (for git-gutter)
vim.o.updatetime = 300 

vim.cmd([[
    " No docstring window for python and go
    autocmd FileType python,go setlocal completeopt-=preview
]])

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
vim.o.undodir = '~/.config/nvim/undo-dir'
vim.o.undofile = true

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme("base16-gruvbox-dark-hard")

-- Config for showing invisible chars
vim.keymap.set('n', '<Leader>l', ':set list!<cr>')
vim.o.listchars = 'tab:▸\\ ,eol:¬,space:␣'


vim.cmd([[
    augroup MyGroup
        autocmd!
        autocmd FocusLost * silent! wa

        " Python specific
        autocmd FileType python map <silent> <buffer>
                    \ <leader>pb oimport pdb; pdb.set_trace()<esc>

    augroup END

    " Show list of all files or buffers using fzf
    nnoremap <leader>b :Buffers<CR>
    nnoremap <C-p> :Files<CR>

    " Show list of all files or buffers using fzf
    nnoremap <leader>b :Buffers<CR>
    nnoremap <C-p> :Files<CR>

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
        group = customftGroup
    }
)

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'yaml',
    command = 'setlocal ts=2 sts=2 sw=2 expandtab',
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
    pattern = {'*'},
    command = 'set cursorline',
})

-- Make active window more visible
vim.api.nvim_create_autocmd('WinLeave', {
    group = bgHighlightGroup,
    pattern = {'*'},
    command = 'set nocursorline',
})
