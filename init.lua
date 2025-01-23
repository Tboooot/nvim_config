require("josean.core")
require("josean.lazy")
vim.notify = function(msg, log_level, _)
	if msg:match("mason%-lspconfig.nvim") then
		return
	end
end
