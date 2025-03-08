return {
  {
    -- {
    --   "sourcegraph/sg.nvim",
    --   dependencies = { "nvim-lua/plenary.nvim",
    --     {
    --       "hrsh7th/nvim-cmp",
    --       opts = function(_, opts)
    --         table.insert(opts.sources, {
    --           name = "cody",
    --         })
    --       end
    --     }
    --   },
    --
    --   event = "VeryLazy",
    --
    --   config = function()
    --     require("sg").setup({})
    --
    --     local cody = require("sg.cody.commands")
    --
    --     local map = function(mode, keys, func, desc)
    --       if desc then
    --         desc = "CODY: " .. desc
    --       end
    --       vim.keymap.set(mode, keys, func, { desc = desc })
    --     end
    --
    --     map("n", "<leader>ac", function()
    --       local request = {}
    --       request.row, request.col = unpack(vim.api.nvim_win_get_cursor(0))
    --       request.filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    --       cody.autocomplete(request, function(data)
    --         vim.print(data)
    --       end)
    --     end, "[a]sk cody to auto[c]omplete")
    --   end,
    -- },
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore Last Session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
  },
  -- Nagging about how to use nvim
  {
    "m4xshen/hardtime.nvim",
    event = "VimEnter",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "MasonUpdateAll",
    },
    dependencies = { "Zeioth/mason-extra-cmds", opts = {} },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
    },
    cmd = "Leet",
  },
  -- Creates directories if they don't exist on `nvim <path>`
  "mateuszwieloch/automkdir.nvim",
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      useDefaultKeymaps = true,
    },
  },
  -- Provides an explanation for regular expressions.
  {
    "tomiis4/Hypersonic.nvim",

    event = "CmdlineEnter",
    cmd = "Hypersonic",
    config = function()
      require("hypersonic").setup({})
    end,
    opts = {},
  },
  "akinsho/git-conflict.nvim",
  -- Prettier code action
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
      require("tiny-code-action").setup()
    end,
  },
  -- Free inactive LSPs
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      notifications = true,
      grace_period = 60 * 10,
    },
  },
  -- texinfo support
  { "https://github.com/HiPhish/info.vim", event = "BufEnter" },
  -- neovim in browser
  { "glacambre/firenvim", build = ":call firenvim#install(0)" },
  -- JSDoc comments
  {
    "danymat/neogen",
    config = true,
    keys = {
      { "gca", ":lua require('neogen').generate()<CR>", desc = "Create comment annotation" },
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
}
