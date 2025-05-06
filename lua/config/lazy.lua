local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    -- always use the latest git commit
    version = false,
    -- version = "*", -- try installing the latest stable version for plugins that support semver

    ---limit the maximum amount of concurrent tasks
    concurrency = 8,
    -- rate of network related git operations (clone, fetch, checkout)
    throttle = {
      -- not enabled by default
      enabled = false,
      -- max 2 ops every 5 seconds
      rate = 2,
      -- in ms
      duration = 5 * 1000,
    },
    -- Time in seconds to wait before running fetch again for a plugin.
    -- Repeated update/check operations will not run again until this
    -- cooldown period has passed.
    cooldown = 3600, -- 1 hour
  },
  install = {},
  checker = {
    enabled = false, -- check for plugin updates periodically
    -- notify = true, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

require "config.keymaps"
require "config.autocmds"
