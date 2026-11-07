---@diagnostic disable: undefined-global

-- extended lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cs", "csharp", "rust", "html", "css", "json", "jsonc", "fs", "fsharp" },
	callback = function()
		vim.opt_local.textwidth = 120
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typst" },
	callback = function()
		vim.keymap.set("n", "<leader>h", function()
			local file = vim.fn.expand("%:p")
			vim.system({ "typst", "c", file })
		end, { buffer = true, desc = "Compile Typst file" })
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.keymap.set("n", "<leader>h", ":w<CR>:!python3 %<CR>",
			{ buffer = true, desc = "Run Python file" })
	end
})

-- force to use *my* settings over whatever the Lsp thinks is best.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.opt_local.tabstop     = 8
		vim.opt_local.shiftwidth  = 8
		vim.opt_local.smartindent = false
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab   = false
		vim.opt_local.autoindent  = false
		vim.defer_fn(function()
			if vim.api.nvim_buf_is_valid(args.buf) then
				vim.bo[args.buf].formatexpr = ""
			end
		end, 0)
	end,
})
