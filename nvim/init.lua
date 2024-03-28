-- Neovim configuration file by pkwasniok (01.2024)

-- Plugins
require("packer").startup(function (use)
    use("wbthomason/packer.nvim")

    use("neanias/everforest-nvim")
    use("catppuccin/nvim")

    use("nvim-lualine/lualine.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/nvim-cmp")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("windwp/nvim-ts-autotag")
    use("ggandor/leap.nvim")
    use("ThePrimeagen/harpoon")
    use("stevearc/oil.nvim")
    use("numToStr/Comment.nvim")
end)

-- Colorscheme
vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("catppuccin-macchiato")

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

vim.opt.scrolloff = 5
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

vim.keymap.set("n", "<C-p>", "<cmd>:Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>:Telescope live_grep<cr>")

vim.keymap.set("n", "<leader><leader>", require("harpoon.ui").toggle_quick_menu)
vim.keymap.set("n", "<leader>h", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>j", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<leader>k", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<leader>l", function() require("harpoon.ui").nav_file(4) end)
vim.keymap.set("n", "<C-a>", require("harpoon.mark").add_file)

-- Lualine
require("lualine").setup({
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename"},
        lualine_x = {"encoding"},
        lualine_y = {},
        lualine_z = {},
    }
})

-- Telescope
require("telescope").setup({})

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua", "json", "toml", "yaml", "html", "javascript", "typescript", "rust", "astro"},
    highlight = { enable = true },
    autotag = { enable = true },
})

-- Completition
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm()
                else
                    fallback()
                end
            end
        }),
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"},
        {name = "vsnip"},
        {name = "buffer"},
        {name = "path"},
    })
})

-- LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({ capabilities = capabilities })
    end
})

-- Addons
require("oil").setup()
require("Comment").setup()
require("leap").create_default_mappings()
require("nvim-ts-autotag").setup()

