return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            signcolumn = true,              -- Toggle with `:Gitsigns toggle_signs`
            current_line_blame = false,     -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',     -- 'eol' | 'overlay' | 'right_align'
                delay = 100,
                ignore_whitespace = false,
            },
        }
    end
}
