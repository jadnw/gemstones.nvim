local Color = require("gemstones.lib.color")

local M = {}

local C = Color:new({
  bg = "#20262a",
  fg = "#c6ced4",
  factor = 0.25,
})

M.pal = {
  black = C:shade("#53605c"),
  red = C:shade("#f08789"),
  green = C:shade("#93c68c"),
  blue = C:shade("#80b1d6"),
  yellow = C:shade("#e8ce9b"),
  orange = C:shade("#f4a582"),
  cyan = C:shade("#80c2c5"),
  teal = C:shade("#6dc5aa"),
  magenta = C:shade("#e397bb"),
  purple = C:shade("#b3a8f9"),
  white = C:shade("#c6ced4"),
  comment = "#667a8a",
  bg0 = "#15191c",
  bg1 = "#20262a",
  bg2 = "#2b3339",
  bg3 = "#3c4750",
  bg4 = "#4e5c67",
  fg0 = "#d2d9de",
  fg1 = "#c6ced4",
  fg2 = "#b3bec7",
  fg3 = "#a5b2bd",
  sel0 = "#556571",
  sel1 = "#637583",
}

--- Generate spec
-- @param accent string
-- @param pal table
function M.gen_spec(accent, pal)
  local spec = {
    bg0 = pal.bg0, -- Dark bg (status line and float)
    bg1 = pal.bg1, -- Default bg
    bg2 = pal.bg2, -- Lighter bg (colorcolm folds)
    bg3 = pal.bg3, -- Lighter bg (cursor line)
    bg4 = pal.bg4, -- Conceal, border fg

    fg0 = pal.fg0, -- Lighter fg
    fg1 = pal.fg1, -- Default fg
    fg2 = pal.fg2, -- Darker fg (status line)
    fg3 = pal.fg3, -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.pal = {
    accent = pal[accent],
    black = pal.black,
    red = pal.red,
    green = pal.green,
    blue = pal.blue,
    yellow = pal.yellow,
    orange = pal.orange,
    cyan = pal.cyan,
    teal = pal.teal,
    magenta = pal.magenta,
    purple = pal.purple,
    white = pal.white,
  }

  spec.syntax = {
    attr = pal.yellow.base, -- HTML tag attribues
    bool = pal.orange.base, -- Boolean
    bracket = spec.fg2, -- Brackets and Punctuation
    builtin0 = pal.teal.base, -- Builtin variable
    builtin1 = pal.yellow.base, -- Builtin type
    builtin2 = pal.orange.base, -- Builtin const
    builtin3 = pal.red.bright, -- Not used
    comment = pal.comment, -- Comment
    conditional = pal.magenta.base, -- Conditional and loop
    const = pal.orange.bright, -- Constants, imports and booleans
    constructor = pal.orange.base, -- Constructor, JSX elements
    dep = spec.fg3, -- Deprecated
    field = pal.cyan.base, -- Field, Property
    func = pal.blue.base, -- Functions and Titles
    ident = pal.magenta.bright, -- Identifiers
    keyword = pal.purple.base, -- Keywords
    number = pal.orange.bright, -- Numbers
    operator = pal.purple.bright, -- Operators
    preproc = pal.magenta.base, -- PreProc
    regex = pal.orange.base, -- Regex
    statement = pal.purple.base, -- Statements
    string = pal.green.base, -- Strings
    tag_delimiter = pal.teal.base, -- Tag delimiter
    type = pal.yellow.base, -- Types
    param = pal.yellow.bright, -- Params
    variable = spec.fg1, -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn = pal.yellow.base,
    info = pal.cyan.base,
    hint = pal.green.base,
  }

  spec.diff = {
    add = pal.green.dim,
    delete = pal.red.dim,
    change = pal.cyan.dim,
    text = pal.cyan.dim,
  }

  spec.git = {
    add = pal.cyan.base,
    removed = pal.red.base,
    changed = pal.yellow.base,
    conflict = pal.orange.base,
    ignored = pal.comment,
  }

  return spec
end

return M
