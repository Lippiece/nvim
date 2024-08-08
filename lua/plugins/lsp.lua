return {
  { "dmmulroy/ts-error-translator.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>ca	", "", desc = "БЛЯТЬ" }
    end,
  },
}
