return {
    -- Smart and powerful comment plugin for neovim
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
