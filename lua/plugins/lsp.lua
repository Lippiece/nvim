return {
  { "dmmulroy/ts-error-translator.nvim", opts = {} },
  {
    "nvim-lspconfig",
    event = "BufReadPre",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local tinyca = require("tiny-code-action")

      keys[#keys + 1] = { "<leader>ca	", tinyca.code_action }

      return {
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
      }
    end,
  },
}
