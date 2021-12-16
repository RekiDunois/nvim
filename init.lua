local utils = require('utils')
for _, module_name in ipairs({'keymap'}) do
	local ok, err = pcall(require, module_name)
	if not ok then
		local msg = "calling module: "..module_name.." falil: "..err
		utils.log_err(msg)	
	end
end

utils.load_plugins()
