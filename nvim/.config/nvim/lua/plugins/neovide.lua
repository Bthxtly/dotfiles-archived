if vim.g.neovide then
  vim.o.guifont = "ComicShannsMono Nerd Font:h12" -- text below applies for VimScript
  vim.g.neovide_floating_shadow = false
  vim.keymap.set({ "n", "i" }, "<C-S-V>", '<ESC>"+p', { silent = true })
end

return {}
