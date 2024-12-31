return {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          nil_ls = {
            autostart = true,
          },
        },
      },
    },
  }
