vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
return {
  {
    "junegunn/vim-easy-align",
    lazy = false,
    keys = {
      { "ga", "<Plug>(EasyAlign)", { desc = "Easy align" } },
    },
  },
}
