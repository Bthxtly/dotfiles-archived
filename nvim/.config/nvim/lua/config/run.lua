vim.keymap.set("n", "<leader>cc", "<cmd>lua CompileRunGcc()<CR>", { silent = true, desc = "Run code" })
vim.keymap.set("n", "<leader>mh", "<cmd>lua RunManim('h')<cr>", { silent = true, desc = "Run Manim high quality" })
vim.keymap.set("n", "<leader>ml", "<cmd>lua RunManim('l')<cr>", { silent = true, desc = "Run Manim low quality" })

-- interactive Manim
local function get_class_name()
  local node = vim.treesitter.get_node()
  while node do
    if node:type() == "class_definition" then
      local name_node = node:field("name")[1]
      if name_node then
        local class_name = vim.treesitter.get_node_text(name_node, 0)
        return class_name
      end
    end
    node = node:parent()
  end
  return nil
end

local function render_scene(quality)
  local q = quality or "l"
  local class_name = get_class_name()
  if not class_name then
    print("No class name found at cursor!")
    vim.cmd("q")
    return
  end

  local file_path = vim.fn.expand("%:p")
  local dir_name = vim.fn.expand("%:p:h")
  local file_name = vim.fn.expand("%:t:r")
  local video_path = dir_name .. "/media/videos/" .. file_name
  if q == "l" then
    video_path = video_path .. "/480p15/" .. class_name .. ".mp4"
  else
    video_path = video_path .. "/1080p60/" .. class_name .. ".mp4"
  end

  local cmd =
    string.format("manim -q" .. q .. " '%s' '%s' && mpv --wayland-app-id=manim '%s'", file_path, class_name, video_path)

  vim.cmd("term " .. cmd)
end

local function file_exists(path)
  local handle = io.open(path, "r")
  return handle and handle:close() or false
end

-- Compile function
function CompileRunGcc()
  local ft = vim.bo.filetype

  -- Markdown and Typst
  if ft == "markdown" or ft == "vimwiki" then
    vim.cmd("Markview toggle")
    return
  elseif ft == "typst" then
    vim.cmd("TypstPreview")
    return
  end

  -- C/C++, sh, Rust, Java, Python(Manim)
  vim.cmd("w")
  vim.cmd("set splitbelow")
  vim.cmd("sp")
  vim.cmd("res -5")

  if vim.bo.filetype == "c" then
    vim.cmd("term gcc % -Wall -o %< -lm && time ./%<")
  elseif vim.bo.filetype == "cpp" then
    vim.cmd("term g++ -std=gnu++17 % -Wall -o %< && time ./%<")
  elseif vim.bo.filetype == "sh" then
    vim.cmd("term sh %")
  elseif vim.bo.filetype == "rust" then
    vim.cmd("term cargo run")
  elseif vim.bo.filetype == "java" then
    vim.cmd("term javac % && java %<")
  elseif vim.bo.filetype == "python" then
    if file_exists(vim.fn.expand("%:p:h") .. "/manim.cfg") then
      render_scene("l")
    else
      vim.cmd("term python3 %")
    end
  elseif vim.fn.expand("%:e") == "b" then
    vim.cmd("term brainfuck %")
  end

  vim.cmd("normal i")
end

function RunManim(quality)
  vim.cmd("w")
  vim.cmd("set splitbelow")
  vim.cmd("sp")
  vim.cmd("res -5")
  render_scene(quality or "l")
  vim.cmd("normal i")
end
