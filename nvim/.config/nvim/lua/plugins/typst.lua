return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  opts = {
    open_cmd = "firefox --class typst-preview --new-window %s",
  },
}
