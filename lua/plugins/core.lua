return {
  {
    "folke/lazy.nvim",
    opts = {
      defaults = {
        lazy = false,
        ---@type number? limit the maximum amount of concurrent tasks
        concurrency = 8,
        -- rate of network related git operations (clone, fetch, checkout)
        throttle = {
          enabled = false, -- not enabled by default
          -- max 2 ops every 5 seconds
          rate = 2,
          duration = 1 * 1000, -- in ms
        },
      },
    },
    version = false,
  },
  { "LazyVim/LazyVim", version = false },
}
