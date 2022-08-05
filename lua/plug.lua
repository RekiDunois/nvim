require('packer').init{

}

return require('packer').startup(function(use)
	use {
    		"plasticboy/vim-markdown",
    		ft = {
      			"markdown",
    		},
	}
	use {
  		'kyazdani42/nvim-tree.lua',
		config = function() require("config.nvimtree") end,
  		requires = { 
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}
	use {'gcmt/wildfire.vim', event = "BufRead"}
	use {'mtdl9/vim-log-highlighting'}
	use {'is0n/fm-nvim'}
end)
