return {}
  or {
    -- {
    --   "dmmulroy/ts-error-translator.nvim",
    --   opts = {
    --     servers = { "volar", "vtsls" },
    --   },
    -- },
    -- {
    --   "scalameta/nvim-metals",
    --   ft = { "scala", "sbt" },
    --   event = { "LazyFile", "BufReadPost", "BufNewFile" },
    --   config = function() end,
    -- },
    {
      "Saghen/blink.cmp",
      opts = {
        fuzzy = {
          use_frecency = false,
          use_proximity = false,
          sort = {},
        },
      },
    },
  }
