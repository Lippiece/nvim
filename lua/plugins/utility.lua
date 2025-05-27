return {
  {

    "rmagatti/auto-session",
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  -- Nagging about how to use nvim (hjkl only)
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mason-org/mason.nvim",
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
  },
  -- Provides an explanation for regular expressions.
  -- {
  --   "tomiis4/Hypersonic.nvim",
  --   event = "CmdlineEnter",
  --   cmd = "Hypersonic",
  --   opts = {},
  -- },
  "akinsho/git-conflict.nvim",
  -- Prettier code action
  {
    "Chaitanyabsprip/fastaction.nvim",
    ---@type FastActionConfig
    opts = {
      title = false,
      dismiss_keys = { "<c-c>", "j", "k", "h", "l" },
    },
    keys = {
      {
        "<Leader>ca",
        function()
          require("fastaction").code_action()
        end,
        desc = "LSP code action",
        mode = { "n", "v" },
      },
      {
        "<Leader>cA",
        function()
          require("fastaction").code_action {
            apply = true,
            context = { only = { "source" }, diagnostics = {} },
          }
        end,
        desc = "LSP source (file) action",
        mode = { "n", "v" },
      },
      {
        "<Leader>cM",
        function()
          require("fastaction").code_action {
            apply = true,
            context = {
              only = { "source.addMissingImports.ts" },
              diagnostics = {},
            },
          }
        end,
        desc = "Add missing imports",
        mode = { "n", "v" },
        ft = { "typescript", "javascript" },
      },
      {
        "<Leader>cU",
        function()
          require("fastaction").code_action {
            apply = true,
            context = {
              only = { "source.removeUnused.ts" },
              diagnostics = {},
            },
          }
        end,
        desc = "Remove unused code",
        mode = { "n", "v" },
        ft = { "typescript", "javascript" },
      },
    },
  },
  {
    "aznhe21/actions-preview.nvim",
    enabled = false,
    keys = {
      {
        "<Leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "LSP code action",
        mode = { "n", "v" },
      },
      {
        "<Leader>cA",
        function()
          require("actions-preview").code_actions {
            apply = true,
            context = { only = { "source" }, diagnostics = {} },
          }
        end,
        desc = "LSP source (file) action",
        mode = { "n", "v" },
      },
      {
        "<Leader>cM",
        function()
          require("actions-preview").code_actions {
            apply = true,
            context = {
              only = { "source.addMissingImports.ts" },
              diagnostics = {},
            },
          }
        end,
        desc = "Add missing imports",
        mode = { "n", "v" },
        ft = { "typescript", "javascript" },
      },
      {
        "<Leader>cU",
        function()
          require("actions-preview").code_actions {
            apply = true,
            context = {
              only = { "source.removeUnused.ts" },
              diagnostics = {},
            },
          }
        end,
        desc = "Remove unused code",
        mode = { "n", "v" },
        ft = { "typescript", "javascript" },
      },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
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
  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
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
  -- codeium.vim alternative
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require "neocodeium"
      neocodeium.setup()
    end,
    keys = {
      {
        "<A-f>",
        function()
          require("neocodeium").accept()
        end,
        desc = "Accept",
        mode = { "i" },
      },
      {
        "<A-w>",
        function()
          require("neocodeium").accept_word()
        end,
        desc = "Accept word",
        mode = { "i" },
      },
      {
        "<A-a>",
        function()
          require("neocodeium").accept_line()
        end,
        desc = "Accept line",
        mode = { "i" },
      },
      {
        "<A-e>",
        function()
          require("neocodeium").cycle_or_complete()
        end,
        desc = "Cycle or complete",
        mode = { "i" },
      },
      {
        "<A-r>",
        function()
          require("neocodeium").cycle_or_complete(-1)
        end,
        desc = "Cycle or complete",
        mode = { "i" },
      },
      {
        "<A-c>",
        function()
          require("neocodeium").clear()
        end,
        desc = "Clear",
        mode = { "i" },
      },
    },
  },

  -- NOTE: lazvim's plugins
  -- This is what powers LazyVim's fancy-looking
  -- tabs, which include filetype icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      {
        "<leader>bP",
        "<Cmd>BufferLineGroupClose ungrouped<CR>",
        desc = "Delete Non-Pinned Buffers",
      },
      {
        "<leader>br",
        "<Cmd>BufferLineCloseRight<CR>",
        desc = "Delete Buffers to the Right",
      },
      {
        "<leader>bl",
        "<Cmd>BufferLineCloseLeft<CR>",
        desc = "Delete Buffers to the Left",
      },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      {
        "[B",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "Move buffer prev",
      },
      {
        "]B",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "Move buffer next",
      },
    },
    opts = {
      options = {

        close_command = function(n)
          Snacks.bufdelete(n)
        end,

        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        -- diagnostics_indicator = function(_, _, diag)
        --   local icons = LazyVim.config.icons.diagnostics
        --   local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
        --   return vim.trim(ret)
        -- end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "snacks_layout_box",
          },
        },
        ---@param opts bufferline.IconFetcherOpts
        -- get_element_icon = function(opts)
        --   return LazyVim.config.icons.ft[opts.filetype]
        -- end,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require "lualine_require"
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "alpha",
              "ministarter",
              "snacks_dashboard",
            },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            -- LazyVim.lualine.root_dir(),
            -- {
            --   'diagnostics',
            --   symbols = {
            --     error = icons.diagnostics.Error,
            --     warn = icons.diagnostics.Warn,
            --     info = icons.diagnostics.Info,
            --     hint = icons.diagnostics.Hint,
            --   },
            -- },
            {
              "filetype",
              icon_only = true,
              separator = "",
              padding = { left = 1, right = 0 },
            },
            -- { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"]
                  and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color "Statement" }
              end,
            },

            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"]
                  and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color "Constant" }
              end,
            },

            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color "Debug" }
              end,
            },

            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function()
                return { fg = Snacks.util.color "Special" }
              end,
            },
            -- {
            --   'diff',
            --   symbols = {
            --     added = icons.git.added,
            --     modified = icons.git.modified,
            --     removed = icons.git.removed,
            --   },
            --   source = function()
            --     local gitsigns = vim.b.gitsigns_status_dict
            --     if gitsigns then
            --       return {
            --         added = gitsigns.added,
            --         modified = gitsigns.changed,
            --         removed = gitsigns.removed,
            --       }
            --     end
            --   end,
            -- },
          },
          lualine_y = {
            {
              "progress",
              separator = " ",
              padding = { left = 1, right = 0 },
            },
            { "location", padding = { left = 0, right = 1 } },
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)
      if vim.g.trouble_lualine then
        local trouble = require "trouble"
        local symbols = trouble.statusline {
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        }
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end

      return opts
    end,
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
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

  -- icons
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "snacks.nvim",
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = { map = vim.keymap.set },
      words = { enabled = true },
    },
    keys = {
      {
        "<leader>n",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },

  -- run tasks
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    opts = {
      dap = false,
      task_list = {
        bindings = {
          ["<C-h>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
        },
      },
      form = {
        win_opts = {
          winblend = 0,
        },
      },
      confirm = {
        win_opts = {
          winblend = 0,
        },
      },
      task_win = {
        win_opts = {
          winblend = 0,
        },
      },
    },

    keys = {
      { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>oo", "<cmd>OverseerRun<cr>", desc = "Run task" },
      {
        "<leader>oq",
        "<cmd>OverseerQuickAction<cr>",
        desc = "Action recent task",
      },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
      { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
      { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>o", group = "overseer" },
      },
    },
  },

  -- scp, sftp better support
  {
    "miversen33/netman.nvim",
    lazy = true,
    cmd = {
      "NmloadProvider",
      "Nmlogs",
      "Nmdelete",
      "Nmread",
      "Nmwrite",
    },
    opts = {},
    specs = {
      {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "netman.nvim" },
        optional = true,
        opts = function(_, opts)
          -- opts.sources = require("astrocore").list_insert_unique(opts.sources, { "netman.ui.neo-tree" })
          table.insert(opts.sources, "netman.ui.neo-tree")

          return opts
        end,
      },
    },
  },

  -- Open files with line numbers
  { "wsdjeg/vim-fetch", lazy = false },

  -- Fuzzy finder.
  -- The default key bindings to find files will use Telescope's
  -- `find_files` or `git_files` depending on whether the
  -- directory is a git repo.
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>/",
        "<cmd>Telescope live_grep<cr>",
        desc = "Grep (Root Dir)",
      },
      {
        "<leader><space>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files (Root Dir)",
      },
      -- git
      {
        "<leader>gc",
        "<cmd>Telescope git_commits<CR>",
        desc = "Commits",
      },
      {
        "<leader>gs",
        "<cmd>Telescope git_status<CR>",
        desc = "Status",
      },
      -- search
      {
        '<leader>s"',
        "<cmd>Telescope registers<cr>",
        desc = "Registers",
      },
      -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      {
        "<leader>sd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>sD",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Workspace Diagnostics",
      },
    },
    opts = {},
  },

  -- run tsc with usable results
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {
      use_trouble_qflist = true,
    },
  },

  -- Set buffer options like tabstop heuristically
  -- {
  --   "tpope/vim-sleuth",
  --   config = function()
  --     require("vim-sleuth").setup()
  --   end,
  -- },

  -- Tips for outdated npm packages
  {
    "vuki656/package-info.nvim",
    config = true,
  },

  -- console.log constructor
  {
    "chrisgrieser/nvim-chainsaw",
    event = "VeryLazy",
    opts = {}, -- required even if left empty
    keys = {
      {
        "<leader>rll",
        function()
          require("chainsaw").variableLog()
        end,
        desc = "Log the name & value of the variable under the cursor",
      },
      {
        "<leader>rlo",
        function()
          require("chainsaw").objectLog()
        end,
        desc = "(Object) Log the name & value of the variable under the cursor",
      },
      {
        "<leader>rlo",
        function()
          require("chainsaw").objectLog()
        end,
        desc = "(Object) Log the name & value of the variable under the cursor",
      },
      {
        "<leader>rlc",
        function()
          require("chainsaw").removeLogs()
        end,
        desc = "Clear logs",
      },
    },
  },
}
