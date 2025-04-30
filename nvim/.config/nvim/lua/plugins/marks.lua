return {
  "chentoast/marks.nvim",
  -- config = load_config("tools.marks"),
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    builtin_marks = { ".", "<", ">", "^" },
  },
}
