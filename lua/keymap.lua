local map=require('utils').map
local xmap=require('utils').xmap
local nmap=require('utils').nmap
local fmap=require('utils').fmap

-- I love wasd
map('','a','h')
map('','s','j')
map('','d','l')
map('','w','k')
map('','j','5k')
map('','m','n')
map('','M','N')
map('','n','5j')
map('','A','^')
map('','D','g_')
map('','h','b')
map('','l','w')
map('','k','a')
nmap('<C-j>', '<C-w>k')
nmap('<C-n>', '<C-w>j')

map('i','jj','<ESC>')

-- nvim-tree
map('n','ff',':NvimTreeFocus<CR>') -- NvimTreeFocus can switch focus betwen editor and tree panel

-- copy and pase to system
xmap("<C-c>", [["+y]])
xmap("<C-x>", [["+x]])
nmap("<C-v>", [["+p]])
map("i", "<C-v>", [[<ESC>"+pa]])

nmap("<C-z>", "u")
-- nmap("<C-y>", "y")

nmap("<C-s>", ":w<ENTER>")

-- tabpage
nmap("<S-Tab>", ":tabprevious<CR>")
nmap("<Tab>", ":tabnext<CR>")
nmap("<C-t>n", ":tabnew<CR>")

