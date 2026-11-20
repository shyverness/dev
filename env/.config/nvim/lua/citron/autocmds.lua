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
			timeout = 120,
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

-- に触発された：https://swnakamura.github.io/posts/vim-japanese-input/
--
-- InsertLeave時に時間の除隊を記録し、InsertEnter時にその状態に切り替える
