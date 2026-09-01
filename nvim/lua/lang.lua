lang = {}

lang["python"] = {
	lsp = {
		cmd = { "ty", "server" },
	},
	ts = {
		parsers = { "python", "toml" },
	},
}

lang["c"] = {
	lsp = {
		cmd = { "clangd", "--background-index" },
	},
	ts = {
		parsers = { "c", "cpp", "make", "cmake" },
	},
}

