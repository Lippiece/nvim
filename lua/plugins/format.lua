local conform = require("conform")
return {
  {
    "stevearc/conform.nvim",
    ---@type conform.setupOpts
    opts = {
      -- format_on_save = {
      --   async = true,
      --   ignore_errors = true,
      --   lsp_format = "first",
      --   undojoin = true,
      -- },
      format_after_save = {
        ignore_errors = true,
        undojoin = true,
        lsp_format = "first",
      },
      formatters = {
        oxlint = {
          command = "oxlint",
          args = { "--import-plugin", "--fix", "--fix-suggestions", "--fix-dangerously", "$FILENAME" },
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
          append_args = { "check", "--fix", "--unsafe", "--stdin-file-path", "$FILENAME" },
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
        rust = { "rustfmt", lsp_format = "fallback" },
        injected = { options = { ignore_errors = true } },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
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
        oxlint = {
          cmd = "oxlint",
          stdin = false,
          args = { "--import-plugin", "--format", "unix" },
          stream = "stdout",
          ignore_exitcode = true,
          parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
            source = "oxlint",
            severity = vim.diagnostic.severity.WARN,
          }),
        },
      },
    },
  },
}
