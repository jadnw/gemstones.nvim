-- https://github.com/ray-x/lsp_signature.nvim

local M = {}

function M.get(spec, config, opts)
  return {
    LspSignatureActiveParameter = { fg = spec.bg1, bg = spec.syntax.param },
  }
end

return M
