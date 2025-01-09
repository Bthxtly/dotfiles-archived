return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    sources = {
      cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    },
    keymap = {
      ["<C-y>"] = { "accept", "fallback" },
      ["<CR>"] = {},
    },
  },
}
