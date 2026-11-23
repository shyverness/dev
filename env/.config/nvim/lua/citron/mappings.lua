---@diagnostic disable: undefined-global
---@diagnostic disable: undefined-field
vim.g.mapleader = " "

vim.g.fzf_layout = { window = { width = 1, height = 0.7, yoffset = 1 } }
vim.g.fzf_preview_window = { 'right:50%' }

vim.cmd([[
  command! -bang FilesNoPDF
    \ call fzf#vim#files(
    \   '',
    \   {
    \     'source': 'rg --files --hidden --no-ignore-vcs --glob "!.git" --glob "!*.pdf"',
    \     'options': [
    \       '--preview',
    \       'bat --style=numbers --color=always --line-range :500 {}',
    \       '--preview-window', 'right:40%',
    \       '--multi']
    \   },
    \   <bang>0
    \ )
]])

-- local function fzf_chdir()
-- 	local currentDir = vim.fn.getcwd()
-- 	local sources = {
-- 		"fd . " .. currentDir .. " --type d --follow --exclude '.*' --max-depth 2",
-- 		-- "fd . ~/Desktop/ --type d --follow --exclude '.*' --max-depth 7",
-- 		-- "fd . ~/.config --type d --follow --max-depth 2",
-- 	}
-- 	if vim.fn.isdirectory("/run/media/fuyu147/VOLUME_NOIR/shared-data/") == 1 then
-- 		table.insert(sources, "fd . /run/media/fuyu147/VOLUME_NOIR/shared-data/ --type d --follow --max-depth 3")
-- 	end
-- 	vim.fn['fzf#run']({
-- 		source = table.concat(sources, " ; "),
-- 		sink = function(selected)
-- 			if selected and selected ~= "" then
-- 				vim.fn.chdir(selected)
-- 			end
-- 		end,
-- 		options = {
-- 			"--prompt", currentDir .. " > ",
-- 			"--preview", "tree -L 2 {}",
-- 		},
-- 		window = vim.g.fzf_layout.window
-- 	})
-- end

local file        = "/home/hiver/.config/neomutt/aliases"
local magicNumber = 20

local function fzf_aliases()
	if not file or vim.fn.filereadable(file) ~= 1 then
		vim.notify("File is missing or unreadable: " .. tostring(file))
		return
	end

	local contacts = {}
	for _, line in ipairs(vim.fn.readfile(file)) do
		if line:match("%S") then
			contacts[#contacts + 1] = line:sub(magicNumber)
		end
	end

	if #contacts == 0 then
		vim.notify("No lines found in file")
		return
	end

	vim.fn["fzf#run"]({
		source = contacts,
		sink = function(selected)
			if selected then
				vim.api.nvim_put({ selected }, "c", true, true)
			end
		end,
	})
end

vim.keymap.set("n", "<leader>ma", fzf_aliases)
vim.keymap.set("n", "<Enter>",    "<nop>")
vim.keymap.set("t", "<C-q>",      [[<C-\><C-n>]])
-- vim.keymap.set("n", "<C-t>",      fzf_chdir)
vim.keymap.set("n", "ç",          "<CMD>Oil<CR>",    { desc = "Open current directory" })
vim.keymap.set("n", "<leader>ç",  "<CMD>Oil .<CR>",  { desc = "Open root directory" })
vim.keymap.set("n", "<ESC>",      "<CMD>noh<CR>")
vim.keymap.set("n", "<leader>pf", ":FilesNoPDF<CR>", { desc = "Open fzf (no PDFs)" })
vim.keymap.set("n", "<C-f>",      ":FilesNoPDF<CR>", { desc = "Open fzf (no PDFs)" })
vim.keymap.set("n", "<leader>sk", ":make<CR>",       { desc = "Call :make" })
vim.keymap.set('n', '<C-k><C-v>', function()
	vim.cmd('split | term')
	vim.cmd('startinsert')
end)
vim.keymap.set('n', '<C-k><C-t>', function()
	vim.cmd('term')
	vim.cmd('startinsert')
end)
vim.keymap.set('n',               '<C-k><C-n>', function() vim.cmd('enew') end)
vim.keymap.set("n",               "<A-s>",      ":m +1<CR>")
vim.keymap.set("n",               "<A-r>",      ":m -2<CR>")
vim.keymap.set("v",               "<A-s>",      ":m '>+1<CR>gv")
vim.keymap.set("v",               "<A-r>",      ":m '<-2<CR>gv")
vim.keymap.set({ "n", "v" },      "!",          ":!")
vim.keymap.set({ "n", "v" },      "<leader>w",  "<CMD>write<CR>")
vim.keymap.set({ "n", "v", "x" }, "-",          "0")
vim.keymap.set({ "n", "v", "x" }, ";",          ":")
vim.keymap.set({ "n", "v", "x" }, ":",          ";")
vim.keymap.set({ 'n', 'v', 'x' }, 'j',          'gj')
vim.keymap.set({ 'n', 'v', 'x' }, 'k',          'gk')
vim.keymap.set({ 'n', 'v', 'x' }, 'R',          'gR')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>cz', ':center<CR>')

vim.keymap.set("n", "<leader>y", function()
	vim.fn.jobstart({ pdfReader, vim.fn.expand("%:p:r") .. ".pdf" }, { detach = true })
end, { desc = "Open PDF" })

