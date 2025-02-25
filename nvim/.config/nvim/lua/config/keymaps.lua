-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

--=========================================================================
map("n", "<C-c>", "<esc>")
map("n", "Q", "@q")
map("n", "ck", "<cmd>help digraph-table<cr>")
map("n", "<c-'>", "<c-]>", { desc = "Jump to entry" })
map("n", "<leader>ha", "<cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>", { desc = "All highlight", silent = true })
-- I'm brilliant
map("n", "go", "o<esc>S<esc>gk", { desc = "Add a new blank line below" })
map("n", "gO", "O<esc>S<esc>gj", { desc = "Add a new blank line above" })
-- tab
map("n", "TN", "<cmd>tabnext<cr>", { desc = "switch to next tab" })
map("n", "TP", "<cmd>tabprevious<cr>", { desc = "switch to previous tab" })
map("n", "TT", "<cmd>tabnew<cr>", { desc = "add a new tab" })
-- buffer
map("n", "<leader>bb", "<cmd>bn<cr>", { desc = "switch to next buffer" })
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "switch to next buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "switch to previous buffer" })
map("n", "<leader>bl", "<cmd>ls<cr>", { desc = "list buffers" })
-- unmap H and L
map("n", "H", "H")
map("n", "L", "L")

-- Auto insert spaces after a comma
vim.keymap.set("i", ",", ", ")

-- Toggle highlight search {{{
local hlstate = 0
vim.keymap.set("n", "<leader><CR>", function()
  if hlstate == 0 then
    vim.cmd("nohlsearch")
  else
    vim.cmd("set hlsearch")
  end
  hlstate = 1 - hlstate
end, { silent = true, desc = "Toggle hlsearch" })
--}}}

-- System clipboard copy and paste
vim.keymap.set("n", "Y", '"+y')
vim.keymap.set("v", "Y", '"+y')

-- Quick quit and save
map("n", "<leader>wa", "<cmd>wqall<cr>", { desc = "Write and quit all" })
vim.keymap.set("c", "Q", "q!<CR>") -- force to quit in cmdline
vim.keymap.set("n", "<C-S>", ":w<CR>", { silent = true, desc = "Write file" })
vim.keymap.set("n", "<C-Q>", ":q<CR>", { silent = true, desc = "Quit" })
vim.keymap.set("t", "<C-Q>", "<C-\\><C-N>:q<CR>", { silent = true })
vim.keymap.set("t", "<C-H>", "<C-\\><C-N>")

-- Shortcuts
vim.keymap.set("n", "<F1>", ":cd %:h<CR>", { silent = false, desc = "cd to file path" })
vim.keymap.set("n", "<F2>", ":Maximize<CR>", { silent = true, desc = "Maximize the current window" })
vim.keymap.set("n", "<F3>", ":lua CompileRunGcc()<CR>", { silent = true, desc = "Run code" })
vim.keymap.set("n", "<F8>", ":UndotreeToggle<CR>", { silent = true, desc = "Undotree" })
vim.keymap.set("n", "<F9>", ":Neotree toggle<CR>", { silent = true, desc = "Neotree" })

-- Compile function {{{
function CompileRunGcc()
  if vim.bo.filetype == "c" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("!gcc % -o %< -lm")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "cpp" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term g++ -std=gnu++17 % -Wall -o %< && time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "sh" then
    vim.cmd("w")
    vim.cmd("!time bash %")
  elseif vim.bo.filetype == "python" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term python3 %")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "rust" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term cargo run")
  elseif vim.bo.filetype == "markdown" or vim.bo.filetype == "vimwiki" then
    -- vim.cmd("MarkdownPreviewToggle")
    vim.cmd("Markview toggle")
  elseif vim.bo.filetype == "tex" then
    vim.cmd("w")
    vim.cmd("VimtexCompile")
  end
end --}}}
--=========================================================================
-- Windows manager {{{
-- Disable the default s key
vim.keymap.set("n", "s", "<nop>", { noremap = false })
vim.keymap.set("n", "ss", "s")

-- Use f + arrow keys for moving the cursor around windows
vim.keymap.set("n", "f<Left>", "<C-w>h")
vim.keymap.set("n", "f<Down>", "<C-w>j")
vim.keymap.set("n", "f<Up>", "<C-w>k")
vim.keymap.set("n", "f<Right>", "<C-w>l")

-- Split the screens
vim.keymap.set("n", "s<Down>", ":set splitbelow<CR>:split<CR>")
vim.keymap.set("n", "s<Right>", ":set splitright<CR>:vsplit<CR>")
-- stylua: ignore
vim.keymap.set("n", "s<Up>", function() vim.cmd("set nosplitbelow") vim.cmd("split") vim.cmd("set splitbelow") end)
-- stylua: ignore
vim.keymap.set("n", "s<Left>", function() vim.cmd("set nosplitright") vim.cmd("vsplit") vim.cmd("set splitright") end)

-- -- Open terminal
-- vim.keymap.set("n", "t<Up>", "s<Up>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Down>", "s<Down>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Left>", "s<Left>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Right>", "s<Right>:terminal<CR>:normal i<CR>")

-- Arrange screens
vim.keymap.set("n", "sh", "<C-w>t<C-w>K")
vim.keymap.set("n", "sv", "<C-w>t<C-w>H")
vim.keymap.set("n", "srh", "<C-w>b<C-w>K")
vim.keymap.set("n", "srv", "<C-w>b<C-w>H")
vim.keymap.set("n", "sx", "<C-w><C-x>")
--}}}

-- vim:foldmethod=marker:foldlevel=0
