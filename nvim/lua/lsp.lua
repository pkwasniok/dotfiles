local lsp = vim.lsp
local mason = require("mason")

mason.setup()

lsp.config["python"] = {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { ".git", "pyproject.toml" },
}

lsp.config["c"] = {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp" },
    root_markers = { "Makefile", ".git", "CMakeLists.txt", "Makefile" },
}

lsp.enable({ "python", "c" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        vim.keymap.set({"n"}, "gd", lsp.buf.definition)
        vim.keymap.set({"n"}, "gD", lsp.buf.declaration)
	end
})

