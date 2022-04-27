-- https://github.com/rcarriga/nvim-notify
local M = {}

function M.get(spec, config, opts)
  return {
    NotifyERRORBorder = { fg = spec.diag.error },
    NotifyWARNBorder = { fg = spec.diag.warn },
    NotifyINFOBorder = { fg = spec.diag.info },
    NotifyDEBUGBorder = { fg = spec.diag.hint },
    NotifyTRACEBorder = { fg = spec.bg4 },

    NotifyERRORTitle = { fg = spec.diag.error },
    NotifyWARNTitle = { fg = spec.diag.warn },
    NotifyINFOTitle = { fg = spec.diag.info },
    NotifyDEBUGTitle = { fg = spec.diag.hint },
    NotifyTRACETitle = { fg = spec.syntax.comment },

    NotifyERRORIcon = { link = "NotifyERRORTitle" },
    NotifyWARNIcon = { link = "NotifyWARNTitle" },
    NotifyINFOIcon = { link = "NotifyINFOTitle" },
    NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
    NotifyTRACEIcon = { link = "NotifyTRACETitle" },
  }
end

return M
