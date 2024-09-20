return {
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      require("ts-error-translator").setup()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
      end
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = ,
  -- },
  -- {
  --   "scalameta/nvim-metals",
  --   ft = { "scala", "sbt" },
  --   event = { "LazyFile", "BufReadPost", "BufNewFile" },
  --   config = function() end,
  -- },
}
