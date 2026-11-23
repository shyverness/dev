---@diagnostic disable: undefined-global
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- local citronGroup = augroup("citron", {})

-- remove trailing whitespaces at the end of a line
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = augroup('HighlightYank', {}),
	pattern = '*',
	callback = function()
		vim.hl.hl_op({
			higroup = 'IncSearch',
			timeout = 60,
		})
	end,
})

autocmd("BufReadCmd", {
	pattern = { "*.jpg", "*.png", "*.jpeg", "*.webp" },
	callback = function()
		local file = vim.fn.expand("<afile>")
		vim.fn.jobstart({ "imv", file }, { detach = true })
		vim.cmd("bdelete!")
	end,
})

autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local file = vim.fn.expand("<afile>")
		vim.fn.jobstart({ pdfReader, file }, { detach = true })
		vim.cmd("bdelete!")
	end,
})
