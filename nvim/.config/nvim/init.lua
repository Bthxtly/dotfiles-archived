-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.autocmds")
require("config.keymaps")
require("config.options")
require("config.run")

-- better cmdline
require("vim._extui").enable({})
