return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {
        global_git_icons = false,     -- makes it slow on large projects
    }
}
