-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Close current window split
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "Close Window" })
