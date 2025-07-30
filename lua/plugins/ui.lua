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
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
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
    event = "LspAttach",
    opts = {}, -- needed even when using default config
  },

  -- Show virtual text after blocks containing their header text
  {
    "andersevenrud/nvim_context_vt",
    event = "BufReadPost",
    cmd = { "NvimContextVtToggle" },
  },

  -- Show progress messages
  -- { "j-hui/fidget.nvim", lazy = false, config = true },

  -- Better hover (K)
  {
    enabled = false,
    "lewis6991/hover.nvim",
    event = "LspAttach",
    -- vim.keymap.set("n", "<C-n>", function()
    --   require("hover").hover_switch "next"
    -- end, { desc = "hover.nvim (next source)" })
    keys = {
      {
        "K",
        function()
          require("hover").hover()
        end,
        mode = "n",
        desc = "hover.nvim",
      },
      {
        "gK",
        function()
          require("hover").hover_select()
        end,
        mode = "n",
        desc = "hover.nvim (select)",
      },
    },
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require "hover.providers.lsp"
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          require "hover.providers.dap"
          require "hover.providers.fold_preview"
          require "hover.providers.diagnostic"
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = "single",
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
      }
    end,
  },

  -- Highlight TODO, FIXME, NOTE...
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          -- Set not show a message if hover is not available
          silent = true,
        },
      },
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
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },

    keys = {
      {
        "<leader>sn",
        "",
        desc = "+noice",
      },
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
      {
        "<leader>snl",
        function()
          require("noice").cmd "last"
        end,
        desc = "Noice Last Message",
      },
      {
        "<leader>snh",
        function()
          require("noice").cmd "history"
        end,
        desc = "Noice History",
      },
      {
        "<leader>sna",
        function()
          require("noice").cmd "all"
        end,
        desc = "Noice All",
      },
      {
        "<leader>snd",
        function()
          require("noice").cmd "dismiss"
        end,
        desc = "Dismiss All",
      },
      {
        "<leader>snt",
        function()
          require("noice").cmd "pick"
        end,
        desc = "Noice Picker (Telescope/FzfLua)",
      },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll Forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll Backward",
        mode = { "i", "n", "s" },
      },
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd [[messages clear]]
      end
      require("noice").setup(opts)
    end,
  },
}
