local fzf_cmd = os.getenv("FZF_DEFAULT_COMMAND")
if fzf_cmd == nil or fzf_cmd == "" then
    -- Taken from Fzf-Lua docs here
    -- https://github.com/ibhagwan/fzf-lua/tree/main#default-options
    fzf_cmd = "rg --color=never --files --hidden --follow -g '!.git'"
end

return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {
        global_git_icons = false, -- makes it slow on large projects
        files = {
            cmd = fzf_cmd,
        }
    }
}
