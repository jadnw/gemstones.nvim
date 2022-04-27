-- https://github.com/folke/trouble.nvim

local M = {}

function M.get(spec, config, opts)
  return {
    TroubleCount = { link = "CursorLineNr" },
    TroubleError = { link = "DiagnosticError" },
    TroubleNormal = { fg = spec.fg1 },
    TroubleTextInformation = { link = "DiagnosticInfo" },
    TroubleSignWarning = { link = "DiagnosticWarn" },
    TroubleLocation = { fg = spec.fg1 },
    TroubleWarning = { link = "DiagnosticWarn" },
    TroublePreview = { fg = spec.fg1 },
    TroubleTextError = { link = "DiagnosticError" },
    TroubleSignInformation = { link = "DiagnosticInfo" },
    TroubleIndent = { fg = spec.bg2 },
    TroubleSource = { fg = spec.pal.accent.base },
    TroubleSignHint = { link = "DiagnosticHint" },
    TroubleSignOther = { fg = spec.fg3 },
    TroubleFoldIcon = { link = "CursorLineNr" },
    TroubleTextWarning = { link = "DiagnosticWarn" },
    TroubleCode = { fg = spec.fg1 },
    TroubleInformation = { link = "DiagnosticInfo" },
    TroubleSignError = { link = "DiagnosticError" },
    TroubleFile = { fg = spec.fg1 },
    TroubleHint = { link = "DiagnosticHint" },
    TroubleTextHint = { link = "DiagnosticHint" },
    TroubleText = { fg = spec.fg1 },
  }
end

return M
