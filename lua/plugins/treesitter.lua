return {
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
      { "anuvyklack/pretty-fold.nvim", dependencies = { "anuvyklack/fold-preview.nvim" } },
    },
  },
  "jonsmithers/vim-html-template-literals",
}
