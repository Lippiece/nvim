-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("set termguicolors")
vim.g.mapleader = ","

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.guifont = "FiraCode Nerd Font Mono:h10"
vim.o.clipboard = "unnamedplus"
vim.cmd([[set viminfo='10,\"100,:20,%,n~/.viminfo]])

-- Scroll offsets
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

if vim.g.neovide then
  vim.opt.scrolloff = 15
  vim.opt.sidescrolloff = 15
  vim.g.neovide_transparency = 0.9

  vim.g.neovide_font_hinting = "none"
  vim.g.neovide_font_edging = "subpixelantialias"

  -- Replace with ctrl+v etc
  vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })
end

-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.g.colorcolumn = "80"
vim.g.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true

-- indenting with spaces
-- vim.o.expandtab = true
-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2

-- syntax highlighting
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

vim.wo.wrap = true
vim.wo.linebreak = true

-- netrw
-- vim.g.nocp = 1
-- 	set nocp                    " 'compatible' is not set
-- 	filetype plugin on          " plugins are enabled

-- :set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;ABCDEFGHIJKLMNOPQRSTUVWXYZ
vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
