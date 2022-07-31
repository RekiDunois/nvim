local map=require('utils').map
local xmap=require('utils').xmap
local nmap=require('utils').nmap
 
-- I love wasd
map('','a','h')
map('','s','j')
map('','d','l')
map('','w','k')
map('','W','5k')
map('','S','5j')
map('','A','^')
map('','D','g_')
map('','h','b')
map('','l','w')
map('','k','a')
map('i','jj','<ESC>')

-- nvim-tree
-- map('n','tt',':NvimTreeToggle<CR>') NvimTreeFocus can switch focus betwen editor and tree panel
-- map('n','tt',':NvimTreeFocus<CR>')

xmap("<C-y>", [["+y]])
nmap("<C-v>", [["+p]])
map("i", "<C-v>", [[<ESC>"+pa]])

nmap("<C-z>", "u")
nmap("<C-s>", ":w<ENTER>")
nmap(";", ":")

