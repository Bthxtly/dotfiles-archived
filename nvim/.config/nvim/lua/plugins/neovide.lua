if vim.g.neovide then
  vim.o.guifont = "ComicShannsMono Nerd Font:h13" -- text below applies for VimScript
  vim.keymap.set("n", "<C-S-V>", '"+p', { silent = true })
  vim.keymap.set("i", "<C-S-V>", '"+p', { silent = true })
  return {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "strawberry-light",
    },
  }
end
return {}
