return {
  -- @type LazyVimConfig
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
  -- Colorscheme
  -- {
  --   "0xstepit/flow.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("flow").setup({})
  --     vim.cmd([[colorscheme flow]])
  --   end,
  -- },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        -- colors = {}, -- Override default colors or create your own
        -- highlights = {}, -- Override default highlight groups or create your own
        styles = { -- For example, to apply bold and italic, use "bold,italic"
          types = "italic", -- Style that is applied to types
          methods = "NONE", -- Style that is applied to methods
          numbers = "NONE", -- Style that is applied to numbers
          strings = "NONE", -- Style that is applied to strings
          comments = "italic", -- Style that is applied to comments
          keywords = "bold", -- Style that is applied to keywords
          constants = "bold", -- Style that is applied to constants
          functions = "NONE", -- Style that is applied to functions
          operators = "NONE", -- Style that is applied to operators
          variables = "NONE", -- Style that is applied to variables
          parameters = "NONE", -- Style that is applied to parameters
          conditionals = "NONE", -- Style that is applied to conditionals
          virtual_text = "italic", -- Style that is applied to virtual text
        },
        -- filetypes = { -- Override which filetype highlight groups are loaded
        --   c = true,
        --   comment = true,
        --   go = true,
        --   html = true,
        --   java = true,
        --   javascript = true,
        --   json = true,
        --   lua = true,
        --   markdown = true,
        --   php = true,
        --   python = true,
        --   ruby = true,
        --   rust = true,
        --   scss = true,
        --   toml = true,
        --   typescript = true,
        --   typescriptreact = true,
        --   vue = true,
        --   xml = true,
        --   yaml = true,
        -- },

        options = {
          cursorline = true, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          lualine_transparency = true, -- Center bar transparency?
          highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
        },
      })

      vim.cmd([[colorscheme onedark]])
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  -- },
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
      },
    },
  },
  -- {
  --   "zaldih/themery.nvim",
  --   lazy = false,
  --   config = function()
  --     require("themery").setup({
  --       livePreview = true, -- Apply theme while picking. Default to true.
  --     })
  --   end,
  -- },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },
  {
    "benfowler/telescope-luasnip.nvim",
    keys = {
      {
        "<leader>fs",
        function()
          require("telescope").load_extension("luasnip")

          vim.cmd("Telescope luasnip")
        end,
        mode = "n",
        desc = "Search snippets",
      },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config
  },
  {
    "Saghen/blink.cmp",

    opts = {
      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,

                text = function(ctx)
                  local lspkind = require("lspkind")
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
    },

    dependencies = { "onsails/lspkind.nvim" },

    sources = {
      default = { "lazydev", "lsp", "snippets", "path" },

      transform_items = function(_, items)
        -- Remove the "Text" source from lsp autocomplete
        return vim.tbl_filter(function(item)
          return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
        end, items)
      end,

      providers = {
        buffer = {
          enable = false,
        },
      },
    },
  },
}
