return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      -- Highlight function arguments
      {
        "m-demare/hlargs.nvim",
        opts = {},
      },
      -- Unjoin lines
      {
        "AckslD/nvim-trevJ.lua",
        opts = {},
        keys = {
          {
            "<leader>j",
            function()
              require("trevj").format_at_cursor()
            end,
            desc = "Unjoin lines",
          },
        },
      },
      -- "anuvyklack/pretty-fold.nvim",
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
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  "jonsmithers/vim-html-template-literals",

  -- Auto set commentstring
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = true,
  },

  -- auto set indent by parsing first 1000 lines
  { "NMAC427/guess-indent.nvim", config = true },
}
