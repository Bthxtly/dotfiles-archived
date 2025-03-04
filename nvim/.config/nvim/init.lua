-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.autocmds")
require("config.keymaps")
require("config.options")

if vim.g.neovide or vim.env.TERM_PROGRAM == "ghostty" then
  vim.cmd("colorscheme rose-pine")
else
  vim.cmd("colorscheme gruvbox")
end
