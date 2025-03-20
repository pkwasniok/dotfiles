-- Neovim configuration by pkwasniok

-- Plugins
require("packer").startup(function (use)
    use("wbthomason/packer.nvim")
    use("catppuccin/nvim")
    use("nvim-treesitter/nvim-treesitter")

    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope.nvim", branch = '0.1.x' })
    use({ "ThePrimeagen/harpoon", branch = "harpoon2" })

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-emoji")
end)

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "c", "php" },
    highlight = { enable = true },
})

-- Completion
cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
        { name = "emoji" },
        { name = "calc" },
    }),
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                else
                    cmp.select_next_item()
                end
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.get_selected_entry() then
                cmp.confirm()
            else
                fallback()
            end
        end)
    },
})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup();

-- Colorscheme
vim.cmd.colorscheme("catppuccin-mocha")

-- Options
vim.opt.mouse = ""

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.colorcolumn = "80"

vim.opt.shell = "/bin/zsh"

vim.opt.completeopt = "menuone,noselect"
vim.opt.termguicolors = true

vim.opt.hlsearch = false

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set({"t"}, "<ESC>", "<C-\\><C-N>")

vim.keymap.set({"n", "v"}, "<C-j>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<C-k>", "<C-u>zz")

local builtin = require("telescope.builtin")
vim.keymap.set({"n"}, "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set({"n"}, "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set({"n"}, "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set({"n"}, "<C-u>", function() harpoon:list():select(1) end)
vim.keymap.set({"n"}, "<C-i>", function() harpoon:list():select(2) end)
vim.keymap.set({"n"}, "<C-o>", function() harpoon:list():select(3) end)
vim.keymap.set({"n"}, "<C-p>", function() harpoon:list():select(4) end)

