local go = vim.o
local wo = vim.wo

go.mouse = 'a'
wo.number = true
vim.g.vim_markdown_folding_disabled = 1

vim.cmd(':set ignorecase smartcase')
vim.cmd(':set tabstop=4')
vim.cmd(':set shiftwidth=4')
vim.cmd(':set expandtab')
