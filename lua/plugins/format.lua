return {
  {
    "stevearc/conform.nvim",
    -- optional = true,
    opts = {
      format = {
        timeout_ms = 20000,
        async = false,       -- not recommended to change
        quiet = false,       -- not recommended to change
        lsp_fallback = true, -- not recommended to change
      },
      formatters_by_ft = {
        javascript = { "biome", "eslint_d" },
        typescript = { "biome", "eslint_d" },
        javascriptreact = { "biome", "eslint_d" },
        typescriptreact = { "biome", "eslint_d" },
        astro = { "prettier", "biome", "eslint_d" },
        vue = { "prettier", "biome", "eslint_d" },
        css = { "stylelint", "prettier" },
        html = { "tidy" },
        json = { "biome", "fixjson" },
        jsonc = { "biome" },
        lua = { "stylua" },
        python = { "isort", "black" },
        yaml = { "yamlfix" },
        fish = { "fish_indent" },
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
        astro = { "biomejs", "eslint_d" },
        vue = { "biomejs", "eslint_d" },
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
