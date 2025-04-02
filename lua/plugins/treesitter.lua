return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "RRethy/nvim-treesitter-textsubjects",
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "m-demare/hlargs.nvim",
        opts = {},
      },
      "AckslD/nvim-trevJ.lua",
      -- "anuvyklack/pretty-fold.nvim",
    },
    keys = {
      { "v", "v", desc = "Increment Selection", mode = "v" },
      { "v", "V", desc = "Decrement Selection", mode = "v" },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    -- main = "nvim-treesitter.configs", -- Sets main module to use for opts
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          scope_incremental = false,
          node_incremental = "v",
          node_decremental = "V",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   event = "VeryLazy",
  --   enabled = true,
  --   config = function()
  --     -- When in diff mode, we want to use the default
  --     -- vim text objects c & C instead of the treesitter ones.
  --     local move = require "nvim-treesitter.textobjects.move" ---@type table<string,fun(...)>
  --     local configs = require "nvim-treesitter.configs"
  --     for name, fn in pairs(move) do
  --       if name:find "goto" == 1 then
  --         move[name] = function(q, ...)
  --           if vim.wo.diff then
  --             local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
  --             for key, query in pairs(config or {}) do
  --               if q == query and key:find "[%]%[][cC]" then
  --                 vim.cmd("normal! " .. key)
  --                 return
  --               end
  --             end
  --           end
  --           return fn(q, ...)
  --         end
  --       end
  --     end
  --   end,
  -- },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  "jonsmithers/vim-html-template-literals",
}
