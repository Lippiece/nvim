-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- Highlight colors like rgb(12,123,12), #a55, etc
  { import = "astrocommunity.color.ccc-nvim" },

  { import = "astrocommunity.comment.ts-comments-nvim" },

  { import = "astrocommunity.editing-support.conform-nvim" },
  -- Show context in virtual text (names of parents after children)
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  -- Vim-doge is a (Do)cumentation (Ge)nerator which will generate a proper documentation skeleton based on certain expressions (mainly functions). Simply put your cursor on a function, press <Leader>d, jump quickly through TODO items using <Tab> and <S-Tab> to quickly add descriptions and go on coding!
  { import = "astrocommunity.editing-support.vim-doge" },

  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- textDocument/documentLink support
  { import = "astrocommunity.lsp.nvim-lsp-endhints" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  -- Kill lsp servers and restore them automatically
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  -- Highlight diagnostic scope
  { import = "astrocommunity.lsp.delimited-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },

  { import = "astrocommunity.recipes.auto-session-restore" },

  -- scp, sftp better support
  { import = "astrocommunity.remote-development.netman-nvim" },

  -- Highlight arguments
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Edit surroundings ([], {}, etc)
  { import = "astrocommunity.syntax.vim-sandwich" },

  -- open files with line numbers
  { import = "astrocommunity.utility.vim-fetch" },
  -- import/override with your plugins folder
}
