-- Neovim configuration by pkwasniok

-- UI2
require('vim._core.ui2').enable()

-- Plugins
vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/folke/tokyonight.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim', version = 'v0.2.2' },
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
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

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end
})

