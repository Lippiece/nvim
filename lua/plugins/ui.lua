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

  -- Show virtual text after blocks containing their header text
  {
    "andersevenrud/nvim_context_vt",
    event = "BufReadPost",
    cmd = { "NvimContextVtToggle" },
  },

  -- Show progress messages
  { "j-hui/fidget.nvim", config = true },

  -- Better hover (K)
  {
    "lewis6991/hover.nvim",

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
        { desc = "hover.nvim" },
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

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set(
        "n",
        "gK",
        require("hover").hover_select,
        { desc = "hover.nvim (select)" }
      )
    end,
  },
}
