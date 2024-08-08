return {
  { "dmmulroy/ts-error-translator.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "<leader>ca	", false },
      })
    end,
  },
}
