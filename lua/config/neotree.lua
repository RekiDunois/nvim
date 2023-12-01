vim.g.neo_tree_remove_legacy_commands = 1

local map = require('utils').map

map('n', 'ff', ':Neotree reveal=true position=left dir=.<CR>')

local function deal_BufWinEnter_event(data)
    local fromQt = vim.fn.argv()[1]
    local real_file_fromQt = vim.fn.filereadable(fromQt) == 1
    local dirname = vim.fn.expand('%:p:h')

    if real_file_fromQt then
        vim.cmd.cd(dirname)
        vim.api.nvim_exec('Neotree reveal=true position=float', true)
        return
    end
end

local function deal_VimEnter_event(data)

    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1
    -- buffer is a no name file
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    local dir_name = vim.fn.expand('%:p:h')

    -- change to the directory
    if real_file or directory then vim.cmd.cd(dir_name) end

    if not no_name and not directory then return end

    if real_file then return end

    -- open the tree
    vim.api.nvim_exec('Neotree reveal=true position=float', true)
end

local function open_nvim_tree(data)
    -- running in gui or cli
    local gui = vim.g.GuiLoaded
    if gui and data.event == "BufWinEnter" then
        deal_BufWinEnter_event(data)
        return
    end

    if not gui and data.event == "VimEnter" then deal_VimEnter_event(data) end
end
-- "BufReadPost"--
vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter"},
                            {callback = open_nvim_tree})

require("neo-tree").setup({
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true},
    close_if_last_window = false,
    sources = {"filesystem", "buffers", "git_status", "document_symbols"},
    source_selector = {statusline = false, winbar = false},
    event_handlers = {

        {
            event = "file_opened",
            handler = function(file_path)
                -- show tree when open file
                vim.api.nvim_exec(
                    'Neotree reveal=true position=left action=show', true)
            end
        },

    },
    filesystem = {
        -- hijack_netrw_behavior = "open_current",
        filtered_items = {
            hide_hidden = false,
            always_show = {".config", ".gitignore"}
        },
        follow_current_file = {enabled = true, leave_dirs_open = true}

    },
    buffers = {
        follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            -- the current file is changed while the tree is open.
            leave_dirs_open = true -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        }
    },
    window = {
        mappings = {
            ["<c-f>"] = "filter_on_submit",
            ["f"] = "",
            ["s"] = "",
            ["w"] = "",
            ["a"] = "",
            ["d"] = "",
            ["<c-d>"] = "delete",
            ["A"] = "add"
        },
        width = 28
    },
    default_component_configs = {
        diagnostics = {
            symbols = {error = "", warn = "", hint = "", info = ""}
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
                conflict = ""
            }
        }

    }

})
