local keymap = vim.keymap

-- Harpooon

local harpoon = require("harpoon")

harpoon:setup()

keymap.set({"n"}, "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
keymap.set({"n"}, "<leader>ha", function() harpoon:list():add() end)
keymap.set({"n"}, "<C-h>", function() harpoon:list():select(1) end)
keymap.set({"n"}, "<C-j>", function() harpoon:list():select(2) end)
keymap.set({"n"}, "<C-k>", function() harpoon:list():select(3) end)
keymap.set({"n"}, "<C-l>", function() harpoon:list():select(4) end)

-- Telescope

local telescope = require("telescope.builtin")

keymap.set({"n", "v", "i"}, "<C-p>", telescope.find_files)
keymap.set({"n", "v", "i"}, "<A-p>", telescope.buffers)

