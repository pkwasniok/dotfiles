local lsp = vim.lsp
local mason = require("mason")

mason.setup()

lsp.config["*"] = {
    root_markers = { ".git", ".hg", "Makefile" },
}

lsp.config["python"] = {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml" },
}

lsp.config["c"] = {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp" },
    root_markers = { "CMakeLists.txt" },
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        keymap.set({"n"}, "gd", lsp.buf.definition)
        keymap.set({"n"}, "gD", lsp.buf.declaration)
	end
})

