return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
  "mong8se/actually.nvim",
  {
    "samjwill/nvim-unception",
    init = function()
      -- Optional settings go here!
      vim.g.unception_open_buffer_in_new_tab = true
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      hijack_netrw_behavior = "disabled", -- netrw left alone, neo-tree does not handle opening dirs (**for remote editing**)
    },
    {
      "mei28/luminate.nvim",
      event = { "VeryLazy" },
      config = function()
        require("luminate").setup({
          -- if you want to customize, see Usage!
        })
      end,
    },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("flow").setup({})
      vim.cmd([[colorscheme flow]])
    end,
  },

  {
    "sontungexpt/better-diagnostic-virtual-text",
    "LspAttach",
    config = function(_)
      require("better-diagnostic-virtual-text").setup({})
    end,
  },
}
