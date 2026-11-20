---@diagnostic disable: undefined-global

vim.pack.add {
	{
		src = 'https://github.com/akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
	}
}

local bufferline = require('bufferline')

bufferline.setup {
	options = {
		indicator = {
			style = "underline",
		},
		diagnostics = "nvim_lsp",
		themable = false,
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		sort_by = "insert_after_current"
	}
}

vim.keymap.set('n', '<A-.>', function()
	vim.cmd [[BufferLineMoveNext]]
end, { desc = 'Move buffer right' })

vim.keymap.set('n', '<A-,>', function()
	vim.cmd [[BufferLineMovePrev]]
end, { desc = 'Move buffer left' })

vim.keymap.set("n", "<A-m>", function()
	vim.cmd [[BufferLineCycleNext]]
end)
vim.keymap.set("n", "<A-k>", function()
	vim.cmd [[BufferLineCyclePrev]]
end)
vim.keymap.set("n", "<C-c>", function()
	vim.cmd [[bdelete!]]
end, { silent = true })
