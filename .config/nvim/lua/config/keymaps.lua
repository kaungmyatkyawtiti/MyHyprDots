-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Resize window
map("n", "<C-w>+", "<cmd>resize +4<cr>", { desc = "Increase Window Height" })
map("n", "<C-w>-", "<cmd>resize -4<cr>", { desc = "Decrease Window Height" })
map("n", "<C-w><", "<cmd>vertical resize -6<cr>", { desc = "Decrease Window Width" })
map("n", "<C-w>>", "<cmd>vertical resize +6<cr>", { desc = "Increase Window Width" })
