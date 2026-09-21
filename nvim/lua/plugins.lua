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

keymap.set({"n"}, "<leader>ff", fuzzyfinder.resume)

keymap.set({"n"}, "<leader>fg", fuzzyfinder.live_grep)
keymap.set({"n"}, "<leader>fb", fuzzyfinder.lgrep_curbuf)

keymap.set({"n"}, "<leader>fw", fuzzyfinder.grep_cword)
keymap.set({"n"}, "<leader>fW", fuzzyfinder.grep_cWORD)

keymap.set({"n"}, "<leader>fl", fuzzyfinder.lsp_document_symbols)
keymap.set({"n"}, "<leader>ft", fuzzyfinder.treesitter)

keymap.set({"n"}, "<C-p>", fuzzyfinder.files)

