return {
  "mbbill/undotree",
  lazy = true,
  -- cmd = { "UndotreeToggle" },
  keys = {
    {
      "<leader>su",
      "<cmd>UndotreeToggle<cr>",
      mode = "n",
      desc = "Undotree",
    },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
