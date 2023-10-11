-- Plugins
require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    use("projekt0n/caret.nvim")
    use("echasnovski/mini.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("ThePrimeagen/harpoon")
    use("nvim-telescope/telescope.nvim")

    use("nvim-treesitter/nvim-treesitter")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
end)

-- Colorscheme
vim.o.background = "dark"
vim.cmd("colorscheme caret")

-- Configuration
vim.g.mapleader = " "

vim.opt.mouse = ""

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.ignorecase = true

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4

-- Keymaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader><leader>", ":bp<CR>")

-- Autopairs
require("mini.pairs").setup()

-- Comments
require("mini.comment").setup()

-- Indentscopes
require("mini.indentscope").setup()

-- Move
require("mini.move").setup()

-- Trailspace
require("mini.trailspace").setup()

-- File tree
require("nvim-tree").setup({})
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>")

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<M-e>", harpoon_ui.toggle_quick_menu)
vim.keymap.set({"n", "i"}, "<M-a>", harpoon_mark.add_file)
vim.keymap.set({"n", "i"}, "<M-h>", function() harpoon_ui.nav_file(1) end)
vim.keymap.set({"n", "i"}, "<M-j>", function() harpoon_ui.nav_file(2) end)
vim.keymap.set({"n", "i"}, "<M-k>", function() harpoon_ui.nav_file(3) end)
vim.keymap.set({"n", "i"}, "<M-l>", function() harpoon_ui.nav_file(4) end)

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

-- Statusline
require("lualine").setup({
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { },
        lualine_x = { "location" },
        lualine_y = { "filename", "encoding" },
        lualine_z = { },
    },
    options = {
        component_separators = "",
    },
})

-- Completition
local cmp = require("cmp")
local cmp_capabilities = require("cmp_nvim_lsp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "n", "i" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "n", "i" })
    })
})

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "json", "yaml", "toml", "lua", "markdown", "html", "python", "rust", "typescript", "css", "typescript", "prisma", "svelte" },
    highlight = { enable = true },
})

-- Language servers
local lspconfig = require("lspconfig")
local mason = require("mason").setup()
local mason_lspconfig = require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end
})

