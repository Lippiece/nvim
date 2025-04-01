return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require "neocodeium"
      neocodeium.setup()
    end,
    keys = {
      {
        "<A-f>",
        function() require("neocodeium").accept() end,
        desc = "Accept",
        mode = { "i" },
      },
      {
        "<A-w>",
        function() require("neocodeium").accept_word() end,
        desc = "Accept word",
        mode = { "i" },
      },
      {
        "<A-a>",
        function() require("neocodeium").accept_line() end,
        desc = "Accept line",
        mode = { "i" },
      },
      {
        "<A-e>",
        function() require("neocodeium").cycle_or_complete() end,
        desc = "Cycle or complete",
        mode = { "i" },
      },
      {
        "<A-r>",
        function() require("neocodeium").cycle_or_complete(-1) end,
        desc = "Cycle or complete",
        mode = { "i" },
      },
      {
        "<A-c>",
        function() require("neocodeium").clear() end,
        desc = "Clear",
        mode = { "i" },
      },
    },
  },
}
