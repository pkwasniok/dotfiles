-- Neovim configuration by pkwasniok

-- Plugins
require("packer").startup(function (use)
    use("wbthomason/packer.nvim")
    -- use("catppuccin/nvim")
    use("nvim-treesitter/nvim-treesitter")

    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope.nvim", branch = '0.1.x' })
    use({ "ThePrimeagen/harpoon", branch = "harpoon2" })

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-emoji")

    use("williamboman/mason.nvim")
end)

-- Options
vim.opt.mouse = ""

vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.colorcolumn = "80"

vim.opt.shell = "/bin/zsh"

vim.opt.completeopt = "menuone,noselect"
vim.opt.termguicolors = true

vim.opt.hlsearch = false

vim.diagnostic.config({ virtual_text = true })

-- Treesitter
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
    ensure_installed = { "lua", "c", "python" },
    highlight = { enable = true },
})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup();

-- Completion
local cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
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

-- Mason
local mason = require("mason")
mason.setup()

-- LSP
vim.lsp.log.set_level("off")
vim.lsp.config["*"] = {
    root_markers = { ".git", ".hg" },
}

vim.lsp.config["lua"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
}

vim.lsp.config["python"] = {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml" },
}

vim.lsp.config["c"] = {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp" },
}

vim.lsp.enable({ "lua", "c", "python" })

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set({"t"}, "<ESC>", "<C-\\><C-N>")

vim.keymap.set({"n", "v"}, "<C-d>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<C-u>", "<C-u>zz")

local builtin = require("telescope.builtin")
vim.keymap.set({"n", "v", "i"}, "<C-p>", builtin.find_files)
vim.keymap.set({"n", "v", "i"}, "<A-p>", builtin.buffers)

vim.keymap.set({"n"}, "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set({"n"}, "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set({"n"}, "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set({"n"}, "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set({"n"}, "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set({"n"}, "<C-l>", function() harpoon:list():select(4) end)

