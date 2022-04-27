-- https://github.com/kyazdani42/nvim-tree.lua

local M = {}

function M.get(spec, config, opts)
  return {
    NvimTreeNormal = { fg = spec.fg2, bg = config.transparent and "NONE" or spec.bg0 },
    NvimTreeVertSplit = { link = "VertSplit" },
    NvimTreeIndentMarker = { fg = spec.bg2 },

    NvimTreeRootFolder = { fg = spec.pal.accent.dim, style = "bold" },
    NvimTreeFolderName = { fg = spec.fg3 },
    NvimTreeFolderIcon = { fg = spec.pal.accent.base },
    NvimTreeOpenedFolderName = { fg = spec.pal.accent.bright },
    NvimTreeEmptyFolderName = { fg = spec.syntax.dep },
    NvimTreeSymlink = { fg = spec.pal.magenta.base },
    NvimTreeSpecialFile = { fg = spec.pal.blue.bright },
    NvimTreeImageFile = { fg = spec.pal.white.dim },
    NvimTreeOpenedFile = { fg = spec.pal.white.base }, -- TODO: not working

    NvimTreeGitDeleted = { fg = spec.git.removed },
    NvimTreeGitDirty = { fg = spec.git.changed },
    NvimTreeGitMerge = { fg = spec.git.confict },
    NvimTreeGitNew = { fg = spec.git.add },
    NvimTreeGitRenamed = { link = "NvimTreeGitDeleted" },
    NvimTreeGitStaged = { link = "NvimTreeGitStaged" },
  }
end

return M
