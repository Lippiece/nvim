return {
  { "dmmulroy/ts-error-translator.nvim", opts = {} },
  {
    "nvim-lspconfig",
    event = "BufReadPre",
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
    },
  },
}
