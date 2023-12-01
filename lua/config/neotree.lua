
            vim.g.neo_tree_remove_legacy_commands = 1

            local map=require('utils').map

            map('n','ff',':Neotree reveal=true dir=.<CR>') 

            require("neo-tree").setup({
                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true
                },
                close_if_last_window = false,
                sources = {
                    "filesystem",
                    "buffers",
                    "git_status",
                    "document_symbols",
                },
                filesystem = {
                    -- hijack_netrw_behavior = "open_current",
                    filtered_items = {
                        hide_hidden = false,
                        always_show = {
                            ".config",
                            ".gitignore"
                        }
                    },
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = true
                    }

                },
                buffers = {
                    follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
            --                      -- the current file is changed while the tree is open.
                    leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                }
                },
                window = {
                    position = "left",
                    mappings = {
                        ["<c-f>"] = "filter_on_submit",
                        ["f"] = "",
                        ["s"] = "",
                        ["w"] = "",
                        ["a"] = "",
                        ["d"] = "",
                        ["<c-d>"] = "delete",
            },
                        
                    },
                    width = 28,
                },
      default_component_configs = {
        diagnostics = {
          symbols = {
            error = "",
            warn = "",
            hint = "",
            info = "",
          },
        },
        git_status = {
          symbols = {
            -- I don't need change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        }
            }
        })
