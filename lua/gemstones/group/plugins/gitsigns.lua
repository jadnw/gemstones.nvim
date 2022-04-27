-- https://github.com/lewis6991/gitsigns.nvim

local M = {}

function M.get(spec, config, opts)
  return {
    GitSignsAdd = { fg = spec.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = spec.git.changed }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = spec.git.removed }, -- diff mode: Deleted line |diff.txt|
  }
end

return M
