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

  -- NOTE: colorscheme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- NOTE: color
  -- Highlight colors like rgb(12,123,12), #a55, etc
  { import = "astrocommunity.color.ccc-nvim" },

  -- NOTE: comment
  { import = "astrocommunity.comment.ts-comments-nvim" },

  -- NOTE: editing-support
  { import = "astrocommunity.editing-support.conform-nvim" },
  -- Show context in virtual text (names of parents after children)
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },

  -- NOTE: lsp
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- textDocument/documentLink support
  { import = "astrocommunity.lsp.nvim-lsp-endhints" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  -- Kill lsp servers and restore them automatically
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  -- Highlight diagnostic scope (borked)
  -- { import = "astrocommunity.lsp.delimited-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.nvim-lint" },

  -- NOTE: recipes
  { import = "astrocommunity.recipes.auto-session-restore" },

  -- NOTE: remote development
  -- scp, sftp better support
  { import = "astrocommunity.remote-development.netman-nvim" },

  -- NOTE: syntax
  -- Highlight arguments
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Edit surroundings ([], {}, etc)
  { import = "astrocommunity.syntax.vim-sandwich" },

  -- NOTE: utility
  -- open files with line numbers
  { import = "astrocommunity.utility.vim-fetch" },
  -- import/override with your plugins folder
}
