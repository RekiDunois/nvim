require('packer').init {}

return require('packer').startup(function(use)
    use {
        "craftzdog/solarized-osaka.nvim",
        config = function() require 'config.color-theme-osaka' end
    }
    use {
        "xiyaowong/transparent.nvim",
        config = function()
            require('transparent').setup {
                groups = {
                    -- "NeoTreeNormal",
                    "NeoTreeWinSeparator",
                    -- "NeoTreeNormalNC",
                },
                exclude_groups = { "NormalFloat", "NeoTreeFloatBorder", "NeoTreeFloatTitle" }
            }
        end
    }
    use { "plasticboy/vim-markdown", ft = { "markdown" } }
    use { 'gcmt/wildfire.vim', event = "BufRead" }
    use { 'mtdl9/vim-log-highlighting' }
    use { 'is0n/fm-nvim' }
    use {
        'notjedi/nvim-rooter.lua',
        config = function()
            require('nvim-rooter').setup {
                rooter_patterns = { '.git', '.hg', '.svn' },
                trigger_patterns = { '*' },
                manual = false,
                fallback_to_parent = false
            }
        end
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
        'neovim/nvim-lspconfig',
        config = function() require('config.lspconfig') end
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require('config.null_ls') end
    }
    use {
        'MunifTanjim/prettier.nvim',
        config = function() require('config.prettier-nvim') end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            -- from lsp
            "hrsh7th/cmp-nvim-lsp",                -- for function parameters
            "hrsh7th/cmp-nvim-lsp-signature-help", -- for OS path
            "hrsh7th/cmp-path",                    -- for words in current buffer
            "hrsh7th/cmp-buffer",                  -- for vim command line
            "hrsh7th/cmp-cmdline",                 -- for snippets
            -- for snippets
            {
                "hrsh7th/vim-vsnip",
                init = function()
                    vim.g.vsnip_snippet_dir =
                        vim.fn.stdpath("config") .. "/vsnip"
                end
            }, "hrsh7th/cmp-vsnip"
        },
        config = function() require("config.nvim-cmp") end
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = function() require('config.statusline') end
    }
    use {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup(
                {
                    toggler = { line = '<c-/>' },
                    opleader = { line = '<c-/>' }
                }
            )
        end
    }
    --    use {
    --        "folke/noice.nvim",
    --        requires = {
    --            "MunifTanjim/nui.nvim"
    --        },
    --        config = function() require('config.noice-nvim') end
    --    }
end)
