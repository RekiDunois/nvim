require('packer').init{

}

return require('packer').startup(function(use)
	use {
    		'kyazdani42/nvim-tree.lua',
    		requires = {
      			'kyazdani42/nvim-web-devicons', -- optional, for file icon
    		},
    		config = function() require'config.nvimtree' end
		}
	use {'gcmt/wildfire.vim', event = "BufRead"}
	use {'mtdl9/vim-log-highlighting'}
end)
