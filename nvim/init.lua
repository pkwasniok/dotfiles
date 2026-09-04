-- Neovim configuration by pkwasniok

-- UI2
require('vim._core.ui2').enable()

-- Plugins
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/Saghen/blink.lib" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.10.2" },
})

-- Colorscheme
vim.cmd.colorscheme("tokyonight-night")

-- Options
require("options")

-- Keymaps
require("keymaps")

-- Language Server Protocol
require("lsp")

-- Plugins
require("plugins")

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end
})

