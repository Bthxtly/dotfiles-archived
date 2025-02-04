if vim.g.neovide then
  vim.o.guifont = "ComicShannsMono Nerd Font:h12" -- text below applies for VimScript
  vim.keymap.set({ "n", "i" }, "<C-S-V>", '<ESC>"+p', { silent = true })
  return {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "strawberry-light",
    },
  }
end

return {}
