-- stylua: ignore
vim.keymap.set("n", "<Left>", function() require("origami").h() end)
-- stylua: ignore
vim.keymap.set("n", "<Right>", function() require("origami").l() end)

return {
  "https://github.com/chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    setupFoldKeymaps = true,
  },
}
