local abbr = {
  isr = "i32",
  iht = "i64",
  fsr = "f32",
  fht = "f64",
  usr = "u32",
  uht = "u64",
  ue = "u8",
}

for ab, type in pairs(abbr) do
  vim.cmd("iabbr " .. ab .. " " .. type)
end
