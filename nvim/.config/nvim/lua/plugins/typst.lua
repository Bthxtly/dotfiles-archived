return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  opts = {
    dependencies_bin = {
      ["tinymist"] = "/usr/bin/tinymist",
      ["websocat"] = "/usr/bin/websocat",
    },
    open_cmd = "firefox --class typst-preview --new-window %s",
  },
}
