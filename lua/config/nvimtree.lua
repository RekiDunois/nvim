local ok, tree_c=pcall(require,"nvim-tree.config")
if not ok then
	vim.notify(tree_c, vim.log.levels.ERROR)
	return
end

local tree_cb = tree_c.nvim_tree_callback

require'nvim-tree'.setup{
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_setup_file = true,
    ignore_ft_on_setup = {'startify', 'dashboard'},
    open_on_tab = true,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    git = {
      ignore = false,
    },
    filters = {
      custom = { "^\\." }
    },
    actions = {
       change_dir = {
	enable = true,
	global = true
       }
    },
    view = {
        side = 'left',
        mappings = {
          custom_only = false,
          list = {
            -- user mappings go here
		{ key = "o", action = "system_open" },
		{ key = "s", action = "" },
		{ key = "W", action = "" },
		{ key = "S", action = "" },
		{ key = "a", action = "" },
		{ key = "d", action = "" },
		{ key = "w", action = "" },
		{ key = "W", action = "" },
		{ key = "D", action = "" },
		{ key = "K", action = "" },
		{ key = "J", action = "" },
		{ key = "k", action = "" },
		{ key = "j", action = "" },
		{ key = "<S-CR>", cb = tree_cb("tabnew") },
		{ key = "<Tab>", action = ""}
          },
        },
    }
}
