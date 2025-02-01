-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("markdown_autocommand", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "markdown_autocommand",
  pattern = "markdown",
  command = "lua Snacks.indent.disable()",
})
