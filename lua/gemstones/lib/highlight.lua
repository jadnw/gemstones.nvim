local M = {}

local function validate(input)
  return input and input or "NONE"
end

local function parse_style(style)
  if not style then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, "([^,]+)") do
    result[token] = true
  end

  return result
end

--- Set terminal colors
-- @param spec
-- @param conf
function M.set_terminal_colors(spec)
  local pal = spec.pal

  local colors = {
    pal.black.base,
    pal.red.base,
    pal.green.base,
    pal.yellow.base,
    pal.blue.base,
    pal.magenta.base,
    pal.cyan.base,
    pal.white.base,
    pal.black.bright,
    pal.red.bright,
    pal.green.bright,
    pal.yellow.bright,
    pal.blue.bright,
    pal.magenta.bright,
    pal.cyan.bright,
    pal.white.bright,
  }

  vim.g.terminal_color_foreground = spec.fg1
  vim.g.terminal_color_background = spec.bg1

  for i, color in ipairs(colors) do
    local n = "terminal_color_" .. i - 1
    vim.g[n] = color
  end

  if vim.fn.has("nvim") == 0 then
    vim.g.terminal_ansi_colors = vim.list(colors)
  end
end

--- Legacy highlight commands for NeoVim 0.6 and earlier
-- @param spec table
-- @param hls table
function M.vim_hl(hls)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "gemstones"
  vim.o.background = "dark"

  for group, opts in pairs(hls) do
    if opts.link and opts.link ~= "" then
      vim.cmd("highlight! link " .. group .. " " .. opts.link)
    else
      local hl = string.format(
        "highlight %s gui=%s guifg=%s guibg=%s %s",
        group,
        validate(opts.style),
        validate(opts.fg),
        validate(opts.bg),
        opts.sp and "guisp=" .. opts.sp or ""
      )
      vim.cmd(hl)
    end
  end
end

--- Highlight commands for NeoVim 0.7+
-- @param spec table
-- @param hls table
function M.nvim_hl(hls)
  vim.o.termguicolors = true
  vim.g.colors_name = "gemstones"
  vim.o.background = "dark"

  for group, opts in pairs(hls) do
    local style = parse_style(opts.style)

    if opts.link and opts.link ~= "" then
      vim.api.nvim_set_hl(0, group, { link = opts.link })
    else
      vim.api.nvim_set_hl(0, group, {
        bg = opts.bg,
        fg = opts.fg,
        bold = style.bold,
        italic = style.italic,
        underline = style.underline,
        undercurl = style.undercurl,
        reverse = style.reverse,
      })
    end
  end
end

if vim.fn.has("nvim-0.7") then
  M.hl = M.nvim_hl
else
  M.hl = M.vim_hl
end

return M
