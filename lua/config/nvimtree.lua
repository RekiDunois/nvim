local ok, tree_c=pcall(require,"nvim-tree.config")
if not ok then
	vim.notify(tree_c, vim.log.levels.ERROR)
	return
end

local map=require('utils').map

map('n','ff',':NvimTreeFocus<CR>') -- NvimTreeFocus can not switch focus bewteen editor and tree panel

local tree_cb = tree_c.nvim_tree_callback

local function deal_BufWinEnter_event(data)
  local fromQt = vim.fn.argv()[1]
  local real_file_fromQt = vim.fn.filereadable(fromQt) == 1
  local dirname = vim.fn.expand('%:p:h')

  if real_file_fromQt then
    vim.cmd.cd(dirname)
    require("nvim-tree.api").tree.change_root(dirname)
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
  if real_file or directory then
    vim.cmd.cd(dir_name)
    require("nvim-tree.api").tree.change_root(dir_name)
  end

  if not no_name and not directory then
    return
  end

  if real_file then
    return
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

local function open_nvim_tree(data)
  -- running in gui or cli
  local gui = vim.g.GuiLoaded
  if gui and data.event == "BufWinEnter" then
    deal_BufWinEnter_event(data)
    return
  end

  if not gui and data.event == "VimEnter" then
      deal_VimEnter_event(data)  
  end
end
--"BufReadPost"--
vim.api.nvim_create_autocmd({ "VimEnter", "BufWinEnter"}, { callback = open_nvim_tree })

require'nvim-tree'.setup{
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    git = {
      ignore = false,
     -- enable = false
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
		{ key = "N", cb = tree_cb("create")},
		{ key = "d", action = "" },
		{ key = "w", action = "" },
		{ key = "W", action = "" },
		{ key = "D", action = "" },
		{ key = "K", action = "" },
		{ key = "J", action = "" },
		{ key = "k", action = "" },
		{ key = "j", action = "" },
		{ key = "m", action = "" },
		{ key = "M", action = "" },
		{ key = "<S-CR>", cb = tree_cb("tabnew") },
		{ key = "<Tab>", action = ""},
		{ key = "<C-t>", action = ""}
          },
        },
    }
}
