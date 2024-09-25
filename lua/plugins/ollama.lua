return {
  "olimorris/codecompanion.nvim",
  event = { "LazyFile", "BufReadPre", "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
  },
  config = true,
  opts = {
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "http://localhost:11434/",
            api_key = "AAAAC3NzaC1lZDI1NTE5AAAAIAdpk+sZApBhaMEcgSNMdmLJUBH6ZcGOO/JB4D6pWT/A",
          },
          headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer ${api_key}",
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
    strategies = { -- Change the adapters as required
      chat = { adapter = "ollama" },
      inline = { adapter = "ollama" },
      agent = { adapter = "ollama" },
    },
  },
}
