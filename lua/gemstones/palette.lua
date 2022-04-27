local M = {}

M.gems = {
  amber = "orange",
  apatite = "teal",
  crystal = "white",
  diamond = "cyan",
  emerald = "green",
  kunzite = "magenta",
  obsidian = "purple",
  ruby = "red",
  sapphire = "blue",
  topaz = "yellow",
}

function M.load_spec(gem)
  gem = vim.tbl_contains(vim.tbl_keys(M.gems), gem) and gem or "emerald"
  local colors = require("gemstones.colors")
  return colors.gen_spec(M.gems[gem], colors.pal)
end

return M
