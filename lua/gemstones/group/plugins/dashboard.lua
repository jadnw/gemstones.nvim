-- https://github.com/glepnir/dashboard-nvim

local M = {}

function M.get(spec, config, opts)
  return {
    DashboardShortCut = { link = "Keyword" },
    DashboardHeader = { fg = spec.pal.accent.base },
    DashboardCenter = { fg = spec.syntax.func },
    DashboardFooter = { fg = spec.syntax.const, style = "italic" },
  }
end

return M
