return {
  { "dmmulroy/ts-error-translator.nvim", opts = {} },
  {
    "nvim-lspconfig",
    event = "BufReadPre",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "<leader>ca	", false }
    end,
  },
}
