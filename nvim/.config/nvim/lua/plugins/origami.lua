return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    foldKeymaps = { setup = true },
  },
-- stylua: ignore
  config = function()
    vim.keymap.set("n", "<Left>", function() require("origami").h() end)
    vim.keymap.set("n", "<Right>", function() require("origami").l() end)
  end,
}
