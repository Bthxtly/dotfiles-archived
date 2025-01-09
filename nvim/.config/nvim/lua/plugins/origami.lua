-- stylua: ignore
-- vim.keymap.set("n", "<Left>", function() require("origami").h() end)
-- stylua: ignore
-- vim.keymap.set("n", "<Right>", function() require("origami").l() end)

return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    keepFoldsAcrossSessions = true,
    pauseFoldsOnSearch = true,
    setupFoldKeymaps = false,

    -- `h` key opens on first column, not at first non-blank character or before
    hOnlyOpensOnFirstColumn = false,
  },
}
