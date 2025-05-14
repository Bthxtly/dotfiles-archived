return {
  "chentoast/marks.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    builtin_marks = { ".", "^" },
    excluded_filetypes = { "AvanteInput" },
    default_mappings = false,
  },
}
