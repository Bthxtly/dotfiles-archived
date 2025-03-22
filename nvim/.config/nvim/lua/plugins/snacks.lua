vim.g.snacks_animate = false

return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        inline = false,
        float = true,
        -- half the defaults
        max_width = 40,
        max_height = 20,
      },
      convert = { notify = false },
      math = { enabled = false },
    },

    indent = { enabled = true },

    picker = { enabled = true },

    explorer = { enabled = true },

    statuscolumn = { enabled = false },

    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        pick = "fzf-lua",
        -- stylua: ignore
        keys = {
          { icon = " ", key = "n", desc = "New file", action = "<cmd>enew<cr>"},
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = "<cmd>FzfLua oldfiles<cr>" },
          -- { icon = " ", key = "c", desc = "Config", action = "<cmd>lua require('fzf-lua').files({cwd = vim.fn.stdpath('config')})<cr>", },
          { icon = " ", key = "s", desc = "Select Session", action = "<cmd>lua require('persistence').select()<cr>", },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":q" },
        },
        -- Used by the `header` section
        header = {
          [[
`7MN.   `7MF'`7MM"""YMM    .g8""8q.`7MMF'   `7MF'`7MMF'`7MMM.     ,MMF'
  MMN.    M    MM    `7  .dP'    `YM.`MA     ,V    MM    MMMb    dPMM  
  M YMb   M    MM   d    dM'      `MM VM:   ,V     MM    M YM   ,M MM  
  M  `MN. M    MMmmMM    MM        MM  MM.  M'     MM    M  Mb  M' MM  
  M   `MM.M    MM   Y  , MM.      ,MP  `MM A'      MM    M  YM.P'  MM  
  M     YMM    MM     ,M `Mb.    ,dP'   :MM;       MM    M  `YM'   MM  
.JML.    YM  .JMMmmmmMMM   `"bmmd"'      VF      .JMML..JML. `'  .JMML.]],
          hl = "Character",
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 0 },
        { section = "startup" },
      },
    },
  },
}
