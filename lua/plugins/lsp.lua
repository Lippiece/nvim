return {
  { "yioneko/nvim-vtsls", event = "VeryLazy" },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        -- signs = {
        --   text = {
        --     [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
        --     [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
        --     [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
        --     [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
        --   },
        -- },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
        -- exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = true,
      },
      -- add any global capabilities here
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      -- format = {
      --   formatting_options = nil,
      --   timeout_ms = nil,
      -- },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          -- ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- diagnostics signs
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      -- local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        -- has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(
          require("mason-lspconfig.mappings.server").lspconfig_to_package
        )
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if
              server_opts.mason == false
              or not vim.tbl_contains(all_mslp_servers, server)
            then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end

      -- lua for neovim
      require("lspconfig").lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath "config"
              and (
                vim.loop.fs_stat(path .. "/.luarc.json")
                or vim.loop.fs_stat(path .. "/.luarc.jsonc")
              )
            then
              return
            end
          end

          client.config.settings.Lua =
            vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                },
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
              },
            })
        end,
        settings = {
          Lua = {},
        },
      }
    end,
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger {
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          }
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufEnter",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        json = { "biomejs", "jsonlint" },
        jsonc = { "biomejs", "jsonlint" },
        javascript = { "biomejs", "eslint_d", "oxlint" },
        typescript = { "biomejs", "eslint_d", "oxlint" },
        typescriptreact = { "biomejs", "eslint_d", "oxlint" },
        javascriptreact = { "biomejs", "eslint_d", "oxlint" },
        astro = { "biomejs", "eslint_d", "oxlint" },
        svelte = { "biomejs", "eslint_d", "oxlint" },
        vue = { "biomejs", "eslint_d", "oxlint" },
        css = { "stylelint" },
        html = { "markuplint" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
        -- ["*"] = { "typos" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {
        -- oxlint = {
        --   cmd = "oxlint",
        --   stdin = false,
        --   args = { "--import-plugin", "--format", "unix" },
        --   stream = "stdout",
        --   ignore_exitcode = true,
        --   parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
        --     source = "oxlint",
        --     severity = vim.diagnostic.severity.WARN,
        --   }),
        -- },
      },
    },
    config = function(_, opts)
      local M = {}

      local lint = require "lint"
      for name, linter in pairs(opts.linters) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] =
            vim.tbl_deep_extend("force", lint.linters[name], linter)
          if type(linter.prepend_args) == "table" then
            lint.linters[name].args = lint.linters[name].args or {}
            vim.list_extend(lint.linters[name].args, linter.prepend_args)
          end
        else
          lint.linters[name] = linter
        end
      end
      lint.linters_by_ft = opts.linters_by_ft

      function M.debounce(ms, fn)
        local timer = vim.uv.new_timer()
        return function(...)
          local argv = { ... }
          timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
          end)
        end
      end

      function M.lint()
        -- Use nvim-lint's logic first:
        -- * checks if linters exist for the full filetype first
        -- * otherwise will split filetype by "." and add all those linters
        -- * this differs from conform.nvim which only uses the first filetype that has a formatter
        local names = lint._resolve_linter_by_ft(vim.bo.filetype)

        -- Create a copy of the names table to avoid modifying the original.
        names = vim.list_extend({}, names)

        -- Add fallback linters.
        if #names == 0 then
          vim.list_extend(names, lint.linters_by_ft["_"] or {})
        end

        -- Add global linters.
        vim.list_extend(names, lint.linters_by_ft["*"] or {})

        -- Filter out linters that don't exist or don't match the condition.
        local ctx = { filename = vim.api.nvim_buf_get_name(0) }
        ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
        names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          -- if not linter then
          --   LazyVim.warn("Linter not found: " .. name, { title = "nvim-lint" })
          -- end
          return linter
            and not (
              type(linter) == "table"
              and linter.condition
              and not linter.condition(ctx)
            )
        end, names)

        -- Run linters.
        if #names > 0 then
          lint.try_lint(names)
        end
      end

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = M.debounce(100, M.lint),
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufEnter",
    opts = {
      default_format_opts = {
        async = true,
        ignore_errors = true,
        lsp_format = "first",
        timeout_ms = 5000,
      },
      format_after_save = {
        async = true,
        ignore_errors = true,
        lsp_format = "first",
      },
      formatters = {
        oxlint = {
          command = "oxlint",
          args = {
            "--import-plugin",
            "--fix",
            "--fix-suggestions",
            "--fix-dangerously",
            "$FILENAME",
          },
          exit_codes = { 0, 2 }, -- code 2 is given when the file includes some non-autofixable errors
          stdin = false,
          tmpfile_format = "ConformOxlint$FILENAME",
        },
        stylelint = {
          meta = {
            url = "https://github.com/stylelint/stylelint",
            description = "A mighty CSS linter that helps you avoid errors and enforce conventions.",
          },
          command = "stylelint",
          args = { "$FILENAME", "--fix" },
          exit_codes = { 0, 2 }, -- code 2 is given when the file includes some non-autofixable errors
          stdin = false,
          tmpfile_format = "ConformStylelint$FILENAME",
        },
        biome_check = {
          command = "biome",
          -- prepend_args = { "--unsafe" },
          append_args = {
            "check",
            "--fix",
            "--unsafe",
            "--stdin-file-path",
            "$FILENAME",
          },
          -- ignore_errors = true,
          -- stdin = true,
          -- stdout = true,
        },
      },
      formatters_by_ft = {
        -- ["*"] = { "injected" },
        javascript = { "biome-check", "oxlint", "eslint_d" },
        typescript = { "biome-check", "oxlint", "eslint_d" },
        javascriptreact = { "biome-check", "oxlint", "eslint_d" },
        typescriptreact = { "biome-check", "oxlint", "eslint_d" },
        astro = { "prettierd", "biome-check", "oxlint", "eslint_d" },
        vue = { "prettierd", "biome-check", "oxlint", "eslint_d" },
        svelte = { "prettierd", "biome-check", "oxlint", "eslint_d" },
        css = { "prettierd" },
        html = { "prettierd", "markuplint" },
        json = { "biome-check", "fixjson" },
        jsonc = { "biome-check" },
        nix = { "alejandra" },
        lua = { "stylua" },
        python = { "isort", "black" },
        yaml = { "yamlfix" },
        fish = { "fish_indent" },
        rust = { "rustfmt" },
        injected = { options = { ignore_errors = true } },
      },
    },
  },

  -- Reword TypeScript errors
  {
    "dmmulroy/ts-error-translator.nvim",
    lazy = true,
    opts = {},
  },
  -- Display LSP inlay hints at the end of the line, rather than within the line.
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {},
  },

  -- textDocument/documentLink support
  {
    "icholy/lsplinks.nvim",
    lazy = true,
    config = true,
  },
}
