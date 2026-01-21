require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("x", "s", "c", { desc = "Delete selection and enter insert mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
