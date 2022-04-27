-- https://github.com/p00f/nvim-ts-rainbow

local M = {}

function M.get(spec, config, opts)
  return {
    rainbowcol1 = { fg = spec.pal.red.base },
    rainbowcol2 = { fg = spec.pal.yellow.base },
    rainbowcol3 = { fg = spec.pal.green.base },
    rainbowcol4 = { fg = spec.pal.blue.base },
    rainbowcol5 = { fg = spec.pal.cyan.base },
    rainbowcol6 = { fg = spec.pal.magenta.base },
    rainbowcol7 = { fg = spec.pal.purple.base },
  }
end

return M
