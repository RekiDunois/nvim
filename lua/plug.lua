require('packer').init{

}

return require('packer').startup(function(use)
	use {'gcmt/wildfire.vim', event = "BufRead"}
	use {'mtdl9/vim-log-highlighting'}
	use {'is0n/fm-nvim'}
end)
