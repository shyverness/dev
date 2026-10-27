---@diagnostic disable: undefined-global

Constants_PersonalEmail   = ""
Constants_UniversityEmail = ""
Constants_codeberg        = ""
Constants_name            = ""

local file = vim.fn.expand("~/.email")
if vim.fn.filereadable(file) == 1 then
	local lines = vim.fn.readfile(file)
	Constants_PersonalEmail   = lines[1]
	Constants_UniversityEmail = lines[2]
	Constants_codeberg        = lines[3]
	Constants_name            = lines[4]
end

return {
	s({ trig = ";c", snippetType = "autosnippet" },
		t("::")
	),
	s({ trig = ";e", snippetType = "autosnippet" },
		t(":=")
	),
	s({ trig = ";t", snippetType = "autosnippet" },
		f(function() return os.date("%Y.%m.%d") end, {})
	),
	s({ trig = ";h", snippetType = "autosnippet" },
		f(function() return os.date("%H:%M") end, {})
	),
	s({ trig = ";mp", snippetType = "autosnippet" },
		t(Constants_PersonalEmail)
	),
	s({ trig = ";mu", snippetType = "autosnippet" },
		t(Constants_UniversityEmail)
	),
	s({ trig = ";mc", snippetType = "autosnippet" },
		t(Constants_codeberg)
	),
	s({ trig = ";mn", snippetType = "autosnippet" },
		t(Constants_name)
	),
	s({ trig = ";[", snippetType = "autosnippet" },
		fmta("\"<>\"", {
			i(1)
		})
	),
	s({ trig = ";x", snippetType = "autosnippet" },
		fmta("« <> »", {
			i(1)
		})
	),
}
