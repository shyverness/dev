---@diagnostic disable: undefined-global

_G.pdfReader             = "zathura"
_G.webBrowser            = "firefox"

-- vim.cmd("filetype plugin off")

vim.opt.clipboard        = "unnamedplus"
vim.o.termguicolors      = tr
vim.opt.mouse            = "a"

vim.cmd[[colorscheme gruber-darker]]
vim.opt.background       = "dark"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 1
vim.g.netrw_winsize      = 25

vim.opt.cmdheight        = 1

vim.opt.winborder        = "single"

vim.opt.wildignorecase   = true

vim.opt.encoding         = "utf-8"
vim.opt.fileencoding     = "utf-8"
vim.opt.termguicolors    = true

vim.opt.switchbuf        = 'usetab'

vim.opt.nu               = true
-- vim.opt.rnu = true

local width        = 8
vim.opt.tabstop          = width
vim.opt.shiftwidth       = width
vim.opt.smartindent      = false
vim.opt.smarttab         = false
vim.opt.softtabstop      = nil
vim.opt.expandtab        = false
vim.opt.autoindent       = false
vim.opt.indentexpr       = ""

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.opt.wrap = false
vim.opt.showbreak = "\\-"

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 3
vim.opt.isfname:append("@-@")

vim.opt.signcolumn = "no"

vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{,}"
vim.opt.foldlevelstart = 99

vim.opt.cursorline = true

vim.opt.colorcolumn = { "72", "80", "120", "180" }
vim.opt.textwidth = 72

vim.opt.list = true
vim.opt.listchars = {
	tab = "> ",
	trail = "·", -- *
	space = "·",
	nbsp = "⍽",
}

-- Highlight group for always-visible non-breaking spaces
vim.cmd([[highlight default Nbsp guibg=#666666 guifg=#ffffff]])

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.spell = false
vim.opt.spelllang = { "en", "fr", "cjk" }
