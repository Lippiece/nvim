return {
  -- lspconfig
  { "mason-org/mason.nvim", cmd = "Mason", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        config = function()
          require("mason-lspconfig").setup {}
          local lspconfig = require "lspconfig"

          vim.lsp.config("vue_ls", {
            root_markers = { "app.vue" },
            init_options = {
              vue = {
                -- disable hybrid mode
                hybridMode = false,
              },
            },
          })

          vim.lsp.config["emmet_language_server"] = {
            filetypes = { "html", "css", "vue", "svelte", "astro" },
            settings = {
              preferences = {
                css = { intUnit = "asd" },
                lorem = { omitCommonPart = true, defaultLang = "ru" },
              },
              css = { intUnit = "asd" },
              lorem = { omitCommonPart = true, defaultLang = "ru" },
            },
            preferences = {
              css = { intUnit = "asd" },
              lorem = { omitCommonPart = true, defaultLang = "ru" },
            },
            init_options = {
              css = { intUnit = "asd" },
              lorem = { omitCommonPart = true, defaultLang = "ru" },
              preferences = {
                css = { intUnit = "asd" },
                lorem = { omitCommonPart = true, defaultLang = "ru" },
              },
            },
          }
        end,
      },
    },
    lazy = false,
    opts = {
      handlers = {
        function(server_name)
          vim.lsp.enable(server_name)
        end,
      },
    },
  },

  { "yioneko/nvim-vtsls", event = "VeryLazy" },

  {
    "mfussenegger/nvim-lint",
    event = "BufEnter",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        json = { "jsonlint", "eslint_d" },
        jsonc = { "jsonlint", "eslint_d" },
        javascript = { "oxlint", "eslint_d" },
        typescript = { "oxlint", "eslint_d" },
        typescriptreact = { "oxlint", "eslint_d" },
        javascriptreact = { "oxlint", "eslint_d" },
        astro = { "oxlint", "eslint_d" },
        svelte = { "oxlint", "eslint_d" },
        vue = { "oxlint", "eslint_d" },
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
        lsp_format = "fallback",
        timeout_ms = 5000,
      },
      format_after_save = function()
        if vim.g.disable_autoformat or vim.b.disable_autoformat then
          return
        end

        return {
          async = true,
          ignore_errors = true,
          lsp_format = "fallback",
        }
      end,
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
          args = {
            "check",
            "--write",
            "--unsafe",
            "--stdin-file-path",
            "$FILENAME",
          },
          stdin = true,
        },
      },
      formatters_by_ft = {
        -- ["*"] = { "injected" },
        javascript = { "biome_check", "oxlint", "eslint_d" },
        typescript = { "biome_check", "oxlint", "eslint_d" },
        javascriptreact = { "biome_check", "oxlint", "eslint_d" },
        typescriptreact = { "biome_check", "oxlint", "eslint_d" },
        astro = { "prettier", "biome_check", "oxlint", "eslint_d" },
        vue = { "prettier", "biome_check", "oxlint", "eslint_d" },
        svelte = { "prettier", "biome_check", "oxlint", "eslint_d" },
        css = { "prettier" },
        html = { "prettier", "markuplint" },
        json = { "biome_check", "eslint_d" },
        jsonc = { "biome_check", "eslint_d" },
        nix = { "alejandra" },
        lua = { "stylua" },
        python = { "isort", "black" },
        yaml = { "yamlfix" },
        fish = { "fish_indent" },
        rust = { "rustfmt" },
        injected = { options = { ignore_errors = true } },
      },
    },
    keys = {
      {
        "<leader>uf",
        function()
          if vim.b.disable_autoformat then
            vim.b.disable_autoformat = false
            vim.print "Enabled autoformat-on-save"
          else
            vim.b.disable_autoformat = true
            vim.print "Disabled autoformat-on-save"
          end
        end,
        desc = "Toggle autoformat-on-save in buffer",
      },
      {
        "<leader>uF",
        function()
          if vim.g.disable_autoformat then
            vim.g.disable_autoformat = false
            vim.print "Enabled autoformat-on-save globally"
          else
            vim.g.disable_autoformat = true
            vim.print "Disabled autoformat-on-save globally"
          end
        end,
        desc = "Toggle autoformat-on-save globally",
      },
    },
  },

  -- Reword TypeScript errors
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "LspAttach",
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
    event = "LspAttach",
    config = true,
    keys = {
      {
        "gx",
        mode = { "n" },
        function()
          require("lsplinks").gx()
        end,
        desc = "Open links",
      },
    },
  },
}
