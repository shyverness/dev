---@diagnostic disable: undefined-global

_G.pdfReader             = "zathura"
_G.webBrowser            = "firefox"

vim.opt.clipboard        = "unnamedplus"
vim.o.termguicolors      = tr
vim.opt.mouse            = "a"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 1
vim.g.netrw_winsize      = 25

vim.opt.cmdheight        = 1

vim.opt.winborder        = "single"
vim.opt.guicursor        = {
	"a:block-Cursor",
	"i:ver30-iCursor",
	"r-cr:hor20-Cursor"
}

vim.opt.wildignorecase   = true

vim.opt.encoding         = "utf-8"
vim.opt.fileencoding     = "utf-8"
vim.opt.termguicolors    = true

vim.opt.switchbuf        = 'usetab'

vim.opt.nu               = true
-- vim.opt.rnu = true

local spaceNumber        = 8
vim.opt.tabstop          = spaceNumber
vim.opt.shiftwidth       = spaceNumber
vim.opt.smartindent      = false
vim.opt.softtabstop      = nil
vim.opt.expandtab        = false
vim.opt.autoindent       = false
vim.opt.indentexpr       = ""


vim.opt.wrap = false
vim.opt.showbreak = "\\-"

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 3
-- vim.opt.sidescrolloff = 0
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

_G.isWriteCommit = false


if vim.g.neovide then
	vim.o.guifont = "courier prime:h18"

	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_refresh_rate_idle = 10

	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_cursor_short_animation_length = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_vfx_mode = ""

	local defaultOpacity = 0.86
	vim.g.neovide_opacity = defaultOpacity
	vim.g.neovide_normal_opacity = 1

	require("citron.sync-opacity")

	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end

	local key_factor = 1.05
	local wheel_factor = 1.01
	vim.keymap.set("n", "<C-)>", function()
		vim.g.neovide_scale_factor = 1.0
	end)
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(key_factor)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / key_factor)
	end)
	vim.keymap.set("n", "<M-ScrollWheelUp>", function()
		change_scale_factor(wheel_factor)
	end)
	vim.keymap.set("n", "<M-ScrollWheelDown>", function()
		change_scale_factor(1 / wheel_factor)
	end)
end
