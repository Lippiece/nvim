-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here

-- Oxlint
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufWritePre" }, {
--   pattern = { "*.js", "*.ts" },
--   callback = function()
--     vim.lsp.start({
--       name = "oxlint",
--       cmd = { "oxlint -D all" },
--       root_dir = vim.fn.getcwd(), -- Use PWD as project root dir.
--     })
--   end,
-- })

local create = vim.api.nvim_create_autocmd
-- create({ "BufWritePost" }, {
--   command = ":lua require('conform').format({async = true, lsp_format = 'first'})",
-- })

-- Set default keyboard layout on leaving insert mode
create({ "InsertLeave" }, {
  command = "silent !qdbus org.kde.keyboard /Layouts setLayout 0",
})
