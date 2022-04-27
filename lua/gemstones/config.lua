local M = {
  gem = "emerald",
}

M.options = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    numbers = "NONE",
    strings = "NONE",
    types = "NONE",
    variables = "NONE",
  },
  inverse = {
    match_paren = false,
    visual = false,
    search = false,
  },
  plugins = {
    bufferline = true,
    cmp = true,
    dashboard = true,
    diagnostic = {
      enable = true,
      background = true,
    },
    gitsigns = true,
    illuminate = true,
    lspsaga = true,
    notify = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    tsrainbow = true,
    whichkey = true,
  },
}

function M.set(user_conf)
  user_conf = user_conf or {}
  M.gem = user_conf.gem or M.gem
  M.options = vim.tbl_deep_extend("keep", user_conf.options or {}, M.options)
end

return M
