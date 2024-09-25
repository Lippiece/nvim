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
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
          },
        })
      end,
    },
  },
}
