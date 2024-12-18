return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<F10>", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      porviders = {
        markdown = {
          filetypes = { "vimwiki.markdown", "markdown" },
        },
      },
    },
    ft = { "markdown", "vimwiki.markdown" },
  },
}
