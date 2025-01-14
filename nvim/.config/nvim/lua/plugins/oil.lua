local api = vim.api

---Functions that create autocommands helpers into the `UserCustomAutocmds` group.
---@class UtilsAutoCmds
---@field group_id integer Group `UserCustomAutocmds` id
local Autocmds = {
  group_id = api.nvim_create_augroup("UserUtilsCustomAutocmds", { clear = true }),
}

---Create an autocmd to launch a file browser plugin when opening dirs.
---@param plugin_name string
---@param plugin_open fun(path: string) Function to open the file browser
local function attach_file_browser(plugin_name, plugin_open)
  local previous_buffer_name
  api.nvim_create_autocmd("BufEnter", {
    group = group_id,
    desc = string.format("[%s] replacement for Netrw", plugin_name),
    pattern = "*",
    callback = function()
      vim.schedule(function()
        local buffer_name = api.nvim_buf_get_name(0)
        if vim.fn.isdirectory(buffer_name) == 0 then
          _, previous_buffer_name = pcall(vim.fn.expand, "#:p:h")
          return
        end

        -- Avoid reopening when exiting without selecting a file
        if previous_buffer_name == buffer_name then
          previous_buffer_name = nil
          return
        else
          previous_buffer_name = buffer_name
        end

        -- Ensure no buffers remain with the directory name
        api.nvim_set_option_value("bufhidden", "wipe", { buf = 0 })
        plugin_open(vim.fn.expand("%:p:h"))
      end)
    end,
  })
end

return {
  {
    "stevearc/oil.nvim",
    -- event = "VeryLazy",
    -- lazy = true,
    -- init = function()
    --   local oil_open_folder = function(path)
    --     require("oil").open(path)
    --   end
    --   attach_file_browser("oil", oil_open_folder)
    -- end,
    -- cmd = { "Oil" },
    -- keys = { "-" },
    opts = {
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
      keymaps = {
        ["+"] = "actions.select",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}
