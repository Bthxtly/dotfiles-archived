return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<F10>", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        -- position = "right",
        -- relative_width = false,
        -- width = 25,
      },
      keymaps = {
        unfold = { "<right>", "l" },
        fold = { "<left>", "h" },
        down_and_jump = "<C-n>",
        up_and_jump = "<C-p>",
        goto_location = { "<CR>", "m" },
        goto_and_close = { "<S-CR>", "M" },
      },
      providers = { -- providers providers providers!!!
        markdown = { filetypes = { "vimwiki", "markdown" } },
      },
    },
    ft = { "markdown", "vimwiki.markdown" },
  },
}
