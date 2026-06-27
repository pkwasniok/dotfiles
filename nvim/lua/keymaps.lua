local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set({"t"}, "<ESC>", "<C-\\><C-N>")

keymap.set({"n", "v"}, "<C-d>", "<C-d>zz")
keymap.set({"n", "v"}, "<C-u>", "<C-u>zz")

