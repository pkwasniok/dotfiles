local lsp = vim.lsp
local mason = require("mason")

mason.setup()

lsp.enable({ "clangd", "ty" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        vim.keymap.set({"n"}, "gd", lsp.buf.definition)
        vim.keymap.set({"n"}, "gD", lsp.buf.declaration)
	end
})

