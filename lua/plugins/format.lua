return {
  {
    "stevearc/conform.nvim",
    -- optional = true,
    opts = {
      default_format_opts = {
        timeout_ms = 20000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback",
        ignore_errors = true,
      },
      formatters = {
        stylelint = {
          meta = {
            url = "https://github.com/stylelint/stylelint",
            description = "A mighty CSS linter that helps you avoid errors and enforce conventions.",
          },
          command = "stylelint",
          args = { "$FILENAME", "--fix" },
          exit_codes = { 0, 2 }, -- code 2 is given when the file includes some non-autofixable errors
          stdin = false,
        },
        biome_check = {
          -- prepend_args = { "--unsafe" },
          append_args = { "--fix", "--unsafe", "--stdin-file-path", "$FILENAME" },
          -- ignore_errors = true,
          -- stdin = true,
          -- stdout = true,
        },
      },
      formatters_by_ft = {
        -- ["*"] = { "injected" },
        javascript = { "biome-check", "eslint_d" },
        typescript = { "biome-check", "eslint_d" },
        javascriptreact = { "biome-check", "eslint_d" },
        typescriptreact = { "biome-check", "eslint_d" },
        astro = { "prettier", "biome-check", "eslint_d", "stylelint" },
        vue = { "prettierd", "biome-check", "eslint_d", "stylelint" },
        css = { "prettierd", "stylelint" },
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
        javascript = { "biomejs", "eslint_d" },
        typescript = { "biomejs", "eslint_d" },
        typescriptreact = { "biomejs", "eslint_d" },
        javascriptreact = { "biomejs", "eslint_d" },
        astro = { "biomejs", "eslint_d", "stylelint" },
        vue = { "biomejs", "eslint_d" },
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
      -- linters = {
      -- -- Example of using selene only when a selene.toml file is present
      -- selene = {
      --   -- `condition` is another LazyVim extension that allows you to
      --   -- dynamically enable/disable linters based on the context.
      --   condition = function(ctx)
      --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- } },
    },
  },
}
