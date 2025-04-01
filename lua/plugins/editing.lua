return {

  -- texinfo support
  { "https://github.com/HiPhish/info.vim", event = "BufEnter" },
  -- Prettier code action
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function() require("tiny-code-action").setup() end,
  },
  -- Provides an explanation for regular expressions.
  {
    "tomiis4/Hypersonic.nvim",

    event = "CmdlineEnter",
    cmd = "Hypersonic",
    config = function() require("hypersonic").setup {} end,
    opts = {},
  },
  -- JSDoc comments
  {
    "danymat/neogen",
    config = true,
    keys = {
      {
        "gca",
        ":lua require('neogen').generate()<CR>",
        desc = "Create comment annotation",
      },
    },
  },
  -- Convert JSON to typescript
  {
    "Redoxahmii/json-to-types.nvim",
    build = "sh install.sh bun", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
    ft = "json",
    keys = {
      {
        "<leader>cU",
        "<CMD>ConvertJSONtoLang typescript<CR>",
        desc = "Convert JSON to TS",
      },
      {
        "<leader>ct",
        "<CMD>ConvertJSONtoLangBuffer typescript<CR>",
        desc = "Convert JSON to TS Buffer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        keymaps = {
          init_selection = "gnn",
          scope_incremental = "grc",
          node_incremental = "v",
          node_decremental = "V",
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "m-demare/hlargs.nvim",
        opts = {},
      },
      "AckslD/nvim-trevJ.lua",
      -- "anuvyklack/pretty-fold.nvim",
    },
  },
}
