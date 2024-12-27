return {
  "saghen/blink.cmp",
  opts = {
    -- sources = {
    --   default = { "codecompanion" },
    --   providers = {
    --     codecompanion = {
    --       name = "CodeCompanion",
    --       module = "codecompanion.providers.completion.blink",
    --       enabled = true,
    --     },
    --   },
    -- },
    keymap = {
      ["<C-y>"] = { "accept", "fallback" },
      ["<CR>"] = {},
    },
  },
}
