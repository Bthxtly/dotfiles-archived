return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      icon = " ",
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = "<cmd>FzfLua oldfiles<cr>" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
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
          --     [[
          -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          hl = "Conceal",
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
