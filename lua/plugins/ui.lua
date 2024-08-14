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
      sources = { "filesystem", "document_symbols" },
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
    event = "LspAttach",
    config = function(_)
      local default_options = {
        ui = {
          wrap_line_after = true, -- wrap the line after this length to avoid the virtual text is too long
          left_kept_space = 3, --- the number of spaces kept on the left side of the virtual text, make sure it enough to custom for each line
          right_kept_space = 3, --- the number of spaces kept on the right side of the virtual text, make sure it enough to custom for each line
          arrow = "  ",
          up_arrow = "  ",
          down_arrow = "  ",
          above = true, -- the virtual text will be displayed above the line
        },
        priority = 1, -- the priority of virtual text
        inline = false,
      }
      require("better-diagnostic-virtual-text").setup(default_options)
    end,
  },
}
