return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    -- opts = function(_, opts)
    --   table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source 'codeium')
    -- end,
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { "mong8se/actually.nvim", opts = {} },
  {
    "samjwill/nvim-unception",
    init = function()
      -- Optional settings go here!
      vim.g.unception_open_buffer_in_new_tab = true
    end,
    asdasd,
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
      require("onedarkpro").setup {
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
      }

      vim.cmd [[colorscheme onedark]]
    end,
  },
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
          require("telescope").load_extension "luasnip"

          vim.cmd "Telescope luasnip"
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
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = "luasnip" },
      signature = { enabled = true, trigger = { show_on_insert = true } },
      completion = {
        list = {
          max_items = 200,

          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = true,
            -- preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end,

            -- When `true`, inserts the completion item automatically when selecting it
            -- You may want to bind a key to the `cancel` command (default <C-e>) when using this option,
            -- which will both undo the selection and hide the completion menu
            auto_insert = false,
            -- auto_insert = function(ctx) return vim.bo.filetype ~= 'markdown' end
          },

          cycle = {
            -- When `true`, calling `select_next` at the _bottom_ of the completion list
            -- will select the _first_ completion item.
            from_bottom = true,
            -- When `true`, calling `select_prev` at the _top_ of the completion list
            -- will select the _last_ completion item.
            from_top = true,
          },
        },
        trigger = {
          -- When true, will prefetch the completion items when entering insert mode
          prefetch_on_insert = false,

          -- When false, will not show the completion window automatically when in a snippet
          show_in_snippet = false,

          -- When true, will show the completion window after typing any of alphanumerics, `-` or `_`
          show_on_keyword = false,

          -- When true, will show the completion window after typing a trigger character
          show_on_trigger_character = false,

          -- When both this and show_on_trigger_character are true, will show the completion window
          -- when the cursor comes after a trigger character after accepting an item
          show_on_accept_on_trigger_character = false,

          -- When both this and show_on_trigger_character are true, will show the completion window
          -- when the cursor comes after a trigger character when entering insert mode
          show_on_insert_on_trigger_character = false,
        },
        accept = { auto_brackets = { enabled = true } },
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,

                text = function(ctx)
                  local lspkind = require "lspkind"
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ =
                      require("nvim-web-devicons").get_icon(ctx.label)
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
                    local dev_icon, dev_hl =
                      require("nvim-web-devicons").get_icon(ctx.label)
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
      providers = {
        buffer = {
          enable = false,
        },
        lsp = {
          transform_items = function(ctx, items)
            -- Remove the "Text" source from lsp autocomplete
            return vim.tbl_filter(function(item)
              return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
            end, items)
          end,
        },
      },
    },
  },
}
