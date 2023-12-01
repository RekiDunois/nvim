local map = require('utils').map

map('n', '<c-s>', '<Cmd>lua require("nvim-lua-format").format()<CR>')

require("nvim-lua-format").setup({save_if_unsaved = true})
