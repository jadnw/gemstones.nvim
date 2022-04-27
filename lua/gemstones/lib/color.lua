local util = require("gemstones.util")
local Color = {}

local default_bg = "#000000"
local default_fg = "#ffffff"
local default_factor = 0.2

--- Define default values for colorscheme
-- @param opts table
-- @return table
function Color:new(opts)
  opts = {
    bg = opts.bg or default_bg,
    fg = opts.fg or default_fg,
    factor = opts.factor or default_factor,
  }
  setmetatable(opts, self)
  self.__index = self
  return opts
end

--- Convert hex to rgb
-- @param color string HEX
-- @return table
function Color.to_rgb(color)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  color = string.lower(color)

  assert(string.find(color, pat) ~= nil, "hex_to_rgb: invalid color: " .. tostring(color))

  local r, g, b = string.match(color, pat)
  r = util.clamp(tonumber(r, 16), 0, 255)
  g = util.clamp(tonumber(g, 16), 0, 255)
  b = util.clamp(tonumber(b, 16), 0, 255)
  return { r = r, g = g, b = b }
end

--- Blend 2 colors
-- @param color1 string HEX
-- @param color2 string HEX
-- @param factor number Float
-- @return string HEX
function Color:blend(color1, color2, factor)
  color1 = self.to_rgb(color1)
  color2 = self.to_rgb(color2)

  -- Get value of each channel
  local bc = function(c)
    local ret = (1 - factor) * color1[c] + factor * color2[c]
    return util.clamp(ret, 0, 255)
  end

  return string.format("#%02X%02X%02X", bc("r"), bc("g"), bc("b"))
end

--- Darken a color
-- @param color string HEX
-- @return string HEX
function Color:darken(color, factor)
  return self:blend(color, self.bg, factor and factor or self.factor)
end

--- Lighten a color
-- @param color string HEX
-- @return string HEX
function Color:lighten(color, factor)
  return self:blend(color, self.fg, factor and factor or self.factor)
end

--- Shade a color into base, dim, bright
-- @param color string HEX
-- @return table
function Color:shade(color)
  local dim = self:darken(color)
  local bright = self:lighten(color)

  return {
    base = color,
    dim = dim,
    bright = bright,
  }
end

-- local C = Color:new({
--   bg = "#2b3339",
--   fg = "#d3c6aa",
-- })
--
-- print(C.bg, C.fg, C.factor)
--
-- local clr = C:shade("#a7c080")
-- print(clr.base, clr.dim, clr.bright)

return Color
