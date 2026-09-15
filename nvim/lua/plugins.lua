local keymap = vim.keymap

-- Blink

local blink = require("blink.cmp")

blink.setup({
	completion = {
		ghost_text = {
			enabled = true,
		},
	},
})

-- Harpooon

local harpoon = require("harpoon")

harpoon:setup()

keymap.set({"n"}, "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
keymap.set({"n"}, "<leader>ha", function() harpoon:list():add() end)
keymap.set({"n"}, "<C-h>", function() harpoon:list():select(1) end)
keymap.set({"n"}, "<C-j>", function() harpoon:list():select(2) end)
keymap.set({"n"}, "<C-k>", function() harpoon:list():select(3) end)
keymap.set({"n"}, "<C-l>", function() harpoon:list():select(4) end)

-- FuzzyFinder

local fuzzyfinder = require("fzf-lua")

fuzzyfinder.setup({})

keymap.set({"n"}, "<C-p>", fuzzyfinder.files)
keymap.set({"n"}, "<C-g>", fuzzyfinder.live_grep)
keymap.set({"n"}, "<C-s>", fuzzyfinder.treesitter)
keymap.set({"n"}, "<S-s>", fuzzyfinder.lsp_document_symbols)

