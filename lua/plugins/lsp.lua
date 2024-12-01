return {}
  or {
    -- {
    --   "dmmulroy/ts-error-translator.nvim",
    --   opts = {
    --     servers = { "volar", "vtsls" },
    --   },
    -- },
    {
      "neovim/nvim-lspconfig",
      opts = function()
        ---@class PluginLspOpts
        local ret = {
          -- options for vim.diagnostic.config()
          ---@type vim.diagnostic.Opts
          -- diagnostics = {
          -- },
          -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
          -- Be aware that you also will need to properly configure your LSP server to
          -- provide the inlay hints.
          -- inlay_hints = {
          --   enabled = true,
          --   exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
          -- },
          -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
          -- Be aware that you also will need to properly configure your LSP server to
          -- provide the code lenses.
          codelens = {
            enabled = false,
          },
          -- Enable lsp cursor word highlighting
          document_highlight = {
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
          -- servers = {
          --       uno
          -- },
          -- you can do any additional lsp server setup here
          -- return true if you don't want this server to be setup with lspconfig
          ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
          -- setup = {
          -- example to setup with typescript.nvim
          -- tsserver = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
          -- },
        }
        return ret
      end,
    },
    -- {
    --   "scalameta/nvim-metals",
    --   ft = { "scala", "sbt" },
    --   event = { "LazyFile", "BufReadPost", "BufNewFile" },
    --   config = function() end,
    -- },
  }
