require('packer').init {}

return require('packer').startup(function(use)
    use {"plasticboy/vim-markdown", ft = {"markdown"}}
    use {'gcmt/wildfire.vim', event = "BufRead"}
    use {'mtdl9/vim-log-highlighting'}
    use {'is0n/fm-nvim'}
    use {
        'notjedi/nvim-rooter.lua',
        -- config = function() require'nvim-rooter'.setup() end
        require('nvim-rooter').setup {
            rooter_patterns = {'.git', '.hg', '.svn'},
            trigger_patterns = {'*'},
            manual = false,
            fallback_to_parent = false
        }
    }
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function() require("config.neotree") end
    }
    use {
        'jeanlucthumm/nvim-lua-format',
        config = function() require("config.lua-format") end,
        ft = {"lua"}
    }
end)
