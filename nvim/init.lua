-- Neovim configuration by pkwasniok

-- Plugins
require("packer").startup(function (use)
    use("wbthomason/packer.nvim")
    use("catppuccin/nvim")
end)

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
































