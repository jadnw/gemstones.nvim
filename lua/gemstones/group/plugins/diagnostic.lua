local M = {}

function M.get(spec, config, opts)
  local d = spec.diag

  return {
    DiagnosticError = { fg = d.error },
    DiagnosticWarn = { fg = d.warn },
    DiagnosticInfo = { fg = d.info },
    DiagnosticHint = { fg = d.hint },

    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignHint = { link = "DiagnosticHint" },

    DiagnosticVirtualTextError = { fg = spec.bg1, bg = opts.background and d.error or "NONE" },
    DiagnosticVirtualTextWarn = { fg = spec.bg1, bg = opts.background and d.warn or "NONE" },
    DiagnosticVirtualTextInfo = { fg = spec.bg1, bg = opts.background and d.info or "NONE" },
    DiagnosticVirtualTextHint = { fg = spec.bg1, bg = opts.background and d.hint or "NONE" },

    DiagnosticUnderlineError = { style = "undercurl", sp = d.error },
    DiagnosticUnderlineWarn = { style = "undercurl", sp = d.warn },
    DiagnosticUnderlineInfo = { style = "undercurl", sp = d.info },
    DiagnosticUnderlineHint = { style = "undercurl", sp = d.hint },
  }
end

return M
