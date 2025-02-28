return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "bwpge/lualine-pretty-path" },
  opts = {
    options = {
      theme = "auto",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = { statusline = { "snacks_dashboard", "Outline" } },
    },
    sections = {
      lualine_a = {},
      lualine_c = { "pretty_path" },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
