-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.diagnostic.config {
  severity_sort = true,
  virtual_lines = true,
  virtual_text = false,
}
