local palette = require("gemstones.palette")
local group = require("gemstones.group")
local highlight = require("gemstones.lib.highlight")

local M = {}

function M.colorscheme()
  local config = require("gemstones.config")
  local spec = palette.load_spec(config.gem)
  local hls = group.get_highlights(spec, config)
  highlight.hl(hls)

  if config.options.terminal_colors then
    highlight.set_terminal_colors(spec)
  end
end

function M.setup(user_conf)
  local config = require("gemstones.config")
  config.set(user_conf)
end

return M
