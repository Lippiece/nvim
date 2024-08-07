-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>ca", function()
--   require("tiny-code-action").code_action()
-- end, { noremap = true, silent = true })
local tinyca = require("tiny-code-action")
local map = vim.keymap.set

map("n", "<leader>ca", tinyca.code_action, { desc = "Tiny Code Action", noremap = true, silent = true })
