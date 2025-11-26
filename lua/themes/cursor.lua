---@type Base46Table
-- Cursor IDE Theme for Neovim
-- EXACT colors extracted from /Applications/Cursor.app/.../cursor-dark-color-theme.json
local M = {}

-- Official Cursor Dark Anysphere v0.0.3 color palette
-- Note: Using 6-character hex colors (no alpha) for base46 compatibility
local c = {
  -- Core UI colors
  bg = "#181818",
  bg_dark = "#141414",
  fg = "#E4E4E4",
  fg_dim = "#9A9A9A",       -- Approximation of #E4E4E48D
  fg_dimmer = "#707070",    -- Approximation of #E4E4E45E
  fg_dimmest = "#505050",   -- Approximation of #E4E4E442

  -- Syntax colors (from tokenColors)
  keyword = "#82D2CE",       -- package, import, const, func, if, return, etc.
  string = "#e394dc",        -- PINK strings!
  func_decl = "#efb080",     -- function declarations (orange)
  func_call = "#ebc88d",     -- function calls (yellow)
  func_purple = "#aaa0fa",   -- some function calls (purple)
  type = "#efb080",          -- types (orange)
  type_class = "#87c3ff",    -- classes (blue)
  variable = "#d6d6dd",      -- variables (light gray)
  constant = "#AAA0FA",      -- constants (purple)
  property = "#AAA0FA",      -- properties (purple)
  number = "#ebc88d",        -- numbers (yellow)
  boolean = "#82d2ce",       -- booleans (cyan)
  comment = "#707070",       -- comments (dimmed gray)
  decorator = "#a8cc7c",     -- decorators (green)
  self_param = "#efb080",    -- self/this (orange)
  namespace = "#CCCCCC",     -- namespaces (light)
  operator = "#d6d6dd",      -- operators
  punctuation = "#d6d6dd",   -- punctuation

  -- Special semantic tokens
  self_keyword = "#CC7C8A",  -- self/this keyword
  macro = "#a8cc7c",         -- macros (green)

  -- UI colors
  selection = "#404040",
  line_highlight = "#262626",
  cursor_line = "#262626",
  border = "#333333",
  find_match = "#3d6a8e",

  -- Git colors
  git_add = "#70B489",
  git_modify = "#F1B467",
  git_delete = "#FC6B83",
  git_untracked = "#88C0D0",
  git_ignored = "#707070",

  -- Diagnostics
  error = "#E34671",
  warning = "#F1B467",
  info = "#88C0D0",
  hint = "#9A9A9A",
  error_fg = "#FC6B83",

  -- Diff
  diff_add_bg = "#2a4a2a",
  diff_delete_bg = "#4a2a2a",
  diff_change = "#D2943E",

  -- Terminal colors
  red = "#FC6B83",
  green = "#70B489",
  yellow = "#F1B467",
  blue = "#81A1C1",
  magenta = "#B48EAD",
  cyan = "#88C0D0",
  white = "#E4E4E4",
}

M.base_30 = {
  white        = c.fg,
  darker_black = "#101010",
  black        = c.bg,
  black2       = c.bg_dark,
  one_bg       = "#1f1f1f",
  one_bg2      = "#262626",
  one_bg3      = "#343434",
  grey         = "#5E5E5E",
  grey_fg      = c.fg_dimmest,
  grey_fg2     = c.fg_dim,
  light_grey   = c.fg_dim,

  red          = c.error_fg,
  baby_pink    = c.string,
  pink         = c.string,       -- #e394dc - PINK strings!
  line         = c.line_highlight,

  green        = c.git_add,
  vibrant_green= c.green,
  nord_blue    = c.func_call,    -- #ebc88d
  blue         = c.type_class,   -- #87c3ff
  yellow       = c.func_call,    -- #ebc88d
  sun          = c.func_call,
  purple       = c.constant,     -- #AAA0FA
  dark_purple  = c.func_purple,  -- #aaa0fa
  teal         = c.keyword,      -- #82D2CE - CYAN keywords!
  orange       = c.func_decl,    -- #efb080
  cyan         = c.keyword,      -- #82D2CE - CYAN keywords!

  statusline_bg = c.bg_dark,
  lightbg      = c.bg_dark,
  pmenu_bg     = c.bg_dark,
  folder_bg    = c.func_call,

  error        = c.error,
  warn         = c.warning,
  hint         = c.hint,
  info         = c.info,
}

M.base_16 = {
  base00 = c.bg,            -- #181818 - Background
  base01 = c.bg_dark,       -- #141414 - Lighter Background
  base02 = "#343434",       -- Selection Background
  base03 = "#5E5E5E",       -- Comments
  base04 = c.fg_dimmest,    -- Dark Foreground (line numbers)
  base05 = c.fg,            -- #E4E4E4 - Default Foreground
  base06 = c.fg,            -- Light Foreground
  base07 = c.white,         -- Brightest
  base08 = c.variable,      -- #d6d6dd - Variables
  base09 = c.number,        -- #ebc88d - Numbers
  base0A = c.func_call,     -- #ebc88d - Classes/Search
  base0B = c.string,        -- #e394dc - PINK Strings!
  base0C = c.type,          -- #efb080 - Types
  base0D = c.func_decl,     -- #efb080 - Functions (orange)
  base0E = c.keyword,       -- #82D2CE - CYAN Keywords!
  base0F = c.decorator,     -- #a8cc7c - Embedded/Escape
}

M.type = "dark"

-- Polish overrides with EXACT Cursor colors
M.polish_hl = {
  -- COMMENTS - Dimmed gray with italic
  Comment = { fg = c.comment, italic = true },
  ["@comment"] = { fg = c.comment, italic = true },

  -- KEYWORDS - CYAN (#82D2CE)
  Keyword = { fg = c.keyword },
  ["@keyword"] = { fg = c.keyword },
  ["@keyword.function"] = { fg = c.keyword },
  ["@keyword.return"] = { fg = c.keyword },
  ["@keyword.operator"] = { fg = c.keyword },
  ["@keyword.conditional"] = { fg = c.keyword },
  ["@keyword.repeat"] = { fg = c.keyword },
  ["@keyword.import"] = { fg = c.keyword },
  ["@keyword.export"] = { fg = c.keyword },
  Statement = { fg = c.keyword },
  Conditional = { fg = c.keyword },
  Repeat = { fg = c.keyword },
  Exception = { fg = c.keyword },
  Include = { fg = c.keyword },
  Define = { fg = c.keyword },
  PreProc = { fg = c.keyword },
  Macro = { fg = c.macro },
  StorageClass = { fg = c.keyword },
  ["@storageclass"] = { fg = c.keyword },

  -- STRINGS - PINK (#e394dc)
  String = { fg = c.string },
  ["@string"] = { fg = c.string },
  ["@string.escape"] = { fg = c.keyword },
  ["@string.special"] = { fg = c.keyword },
  Character = { fg = c.variable },
  ["@character"] = { fg = c.variable },

  -- FUNCTIONS - Orange (#efb080) for declarations, Yellow (#ebc88d) for calls
  Function = { fg = c.func_decl },
  ["@function"] = { fg = c.func_decl },
  ["@function.call"] = { fg = c.func_call },
  ["@function.method"] = { fg = c.func_call },
  ["@function.method.call"] = { fg = c.func_call },
  ["@function.builtin"] = { fg = c.func_call },
  ["@method"] = { fg = c.func_call },
  ["@method.call"] = { fg = c.func_call },

  -- TYPES - Orange (#efb080) and Blue (#87c3ff) for classes
  Type = { fg = c.type },
  ["@type"] = { fg = c.type },
  ["@type.builtin"] = { fg = c.keyword },
  ["@type.definition"] = { fg = c.type },
  ["@type.qualifier"] = { fg = c.type },
  Typedef = { fg = c.type },
  Structure = { fg = c.type },
  ["@constructor"] = { fg = c.type },

  -- VARIABLES - Light gray (#d6d6dd), Purple (#AAA0FA) for constants/properties
  Identifier = { fg = c.variable },
  ["@variable"] = { fg = c.variable },
  ["@variable.parameter"] = { fg = c.variable },
  ["@variable.member"] = { fg = c.variable },
  ["@variable.builtin"] = { fg = c.variable },
  ["@parameter"] = { fg = c.variable },
  ["@field"] = { fg = c.variable },
  ["@property"] = { fg = c.property },

  -- CONSTANTS - Purple (#AAA0FA), Numbers - Yellow (#ebc88d)
  Constant = { fg = c.constant },
  ["@constant"] = { fg = c.constant },
  ["@constant.builtin"] = { fg = c.keyword },
  Number = { fg = c.number },
  ["@number"] = { fg = c.number },
  Float = { fg = c.number },
  ["@float"] = { fg = c.number },
  Boolean = { fg = c.boolean },
  ["@boolean"] = { fg = c.boolean },

  -- OPERATORS & PUNCTUATION
  Operator = { fg = c.operator },
  ["@operator"] = { fg = c.operator },
  ["@punctuation"] = { fg = c.punctuation },
  ["@punctuation.bracket"] = { fg = c.punctuation },
  ["@punctuation.delimiter"] = { fg = c.punctuation },
  ["@punctuation.special"] = { fg = c.keyword },
  Delimiter = { fg = c.punctuation },
  Special = { fg = c.func_call },
  SpecialChar = { fg = c.func_call },
  Label = { fg = c.type },

  -- NAMESPACES & MODULES
  ["@namespace"] = { fg = c.namespace },
  ["@module"] = { fg = c.variable },
  ["@lsp.type.namespace"] = { fg = c.namespace },

  -- LSP SEMANTIC TOKENS
  ["@lsp.type.class"] = { fg = c.type_class },
  ["@lsp.type.enum"] = { fg = c.type },
  ["@lsp.type.interface"] = { fg = c.type },
  ["@lsp.type.struct"] = { fg = c.type },
  ["@lsp.type.type"] = { fg = c.type },
  ["@lsp.type.typeParameter"] = { fg = c.type },
  ["@lsp.type.function"] = { fg = c.func_decl },
  ["@lsp.type.method"] = { fg = c.func_call },
  ["@lsp.type.macro"] = { fg = c.macro },
  ["@lsp.type.keyword"] = { fg = c.keyword },
  ["@lsp.type.comment"] = { fg = c.comment, italic = true },
  ["@lsp.type.string"] = { fg = c.string },
  ["@lsp.type.number"] = { fg = c.number },
  ["@lsp.type.operator"] = { fg = c.operator },
  ["@lsp.type.variable"] = { fg = c.variable },
  ["@lsp.type.parameter"] = { fg = c.variable },
  ["@lsp.type.property"] = { fg = c.property },
  ["@lsp.mod.deprecated"] = { fg = c.fg_dim, strikethrough = true },
  ["@lsp.mod.documentation"] = { fg = c.constant },

  -- Language specific
  ["@lsp.type.variable.go"] = { fg = c.variable },
  ["@lsp.type.namespace.go"] = { fg = c.type },

  -- UI ELEMENTS
  Normal = { bg = c.bg, fg = c.fg },
  NormalFloat = { bg = c.bg_dark, fg = c.fg },
  FloatBorder = { bg = c.bg_dark, fg = c.border },
  FloatTitle = { fg = c.func_call, bold = true },
  Visual = { bg = c.selection },
  CursorLine = { bg = c.cursor_line },
  CursorLineNr = { fg = c.fg, bold = true },
  LineNr = { fg = c.fg_dimmest },
  SignColumn = { bg = c.bg },
  Search = { bg = c.find_match },
  IncSearch = { bg = c.find_match },
  CurSearch = { bg = c.find_match, bold = true },
  Pmenu = { bg = c.bg_dark, fg = c.fg },
  PmenuSel = { bg = "#343434", fg = c.fg },
  PmenuThumb = { bg = c.fg_dimmest },
  MatchParen = { bg = "#3a3a3a", bold = true },
  StatusLine = { bg = c.bg_dark, fg = c.fg_dim },
  StatusLineNC = { bg = c.bg_dark, fg = c.fg_dimmer },
  VertSplit = { fg = c.border },
  WinSeparator = { fg = c.border },
  Title = { fg = c.func_call },
  Directory = { fg = c.string },
  SpecialKey = { fg = c.string },

  -- NvimTree
  NvimTreeNormal = { bg = c.bg_dark, fg = c.fg_dim },
  NvimTreeNormalNC = { bg = c.bg_dark, fg = c.fg_dim },
  NvimTreeWinSeparator = { fg = c.border, bg = c.bg },
  NvimTreeRootFolder = { fg = c.fg_dim },
  NvimTreeFolderName = { fg = c.fg_dim },
  NvimTreeFolderIcon = { fg = c.func_call },
  NvimTreeOpenedFolderName = { fg = c.fg_dim, bold = true },
  NvimTreeEmptyFolderName = { fg = c.fg_dim },
  NvimTreeIndentMarker = { fg = c.border },
  NvimTreeGitDirty = { fg = c.git_modify },
  NvimTreeGitNew = { fg = c.git_untracked },
  NvimTreeGitDeleted = { fg = c.git_delete },
  NvimTreeGitStaged = { fg = c.git_add },
  NvimTreeGitRenamed = { fg = c.git_untracked },
  NvimTreeGitMerge = { fg = c.constant },
  NvimTreeGitIgnored = { fg = c.git_ignored },
  NvimTreeSpecialFile = { fg = c.decorator, bold = true, underline = true },
  NvimTreeBookmark = { fg = c.func_call },

  -- Telescope
  TelescopeNormal = { bg = c.bg_dark, fg = c.fg },
  TelescopeBorder = { bg = c.bg_dark, fg = c.border },
  TelescopePromptNormal = { bg = c.bg, fg = c.fg },
  TelescopePromptBorder = { bg = c.bg, fg = c.border },
  TelescopePromptTitle = { bg = c.info, fg = c.bg_dark, bold = true },
  TelescopePreviewTitle = { bg = c.keyword, fg = c.bg_dark, bold = true },
  TelescopeResultsTitle = { bg = c.constant, fg = c.bg_dark, bold = true },
  TelescopeSelection = { bg = "#2a2a2a", fg = c.fg, bold = true },
  TelescopeSelectionCaret = { fg = c.info, bg = "#2a2a2a" },
  TelescopeMatching = { fg = c.info, bold = true },
  TelescopePromptCounter = { fg = c.fg_dim },
  TelescopeTitle = { fg = c.info },

  -- DIAGNOSTICS
  DiagnosticError = { fg = c.error },
  DiagnosticWarn = { fg = c.warning },
  DiagnosticHint = { fg = c.hint },
  DiagnosticInfo = { fg = c.info },
  DiagnosticVirtualTextError = { fg = c.error, italic = true },
  DiagnosticVirtualTextWarn = { fg = c.warning, italic = true },
  DiagnosticVirtualTextInfo = { fg = c.info, italic = true },
  DiagnosticVirtualTextHint = { fg = c.hint, italic = true },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
  DiagnosticUnnecessary = { fg = c.fg_dim },

  -- GIT
  GitSignsAdd = { fg = c.git_add },
  GitSignsChange = { fg = c.diff_change },
  GitSignsDelete = { fg = c.git_delete },
  DiffAdd = { bg = c.diff_add_bg },
  DiffChange = { fg = c.diff_change },
  DiffDelete = { bg = c.diff_delete_bg },
  DiffText = { bg = c.keyword },
  diffAdded = { fg = c.git_add },
  diffRemoved = { fg = c.git_delete },
  diffChanged = { fg = c.diff_change },

  -- CMP
  CmpItemAbbrMatch = { fg = c.info, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = c.info },
  CmpItemAbbrDeprecated = { fg = c.fg_dim, strikethrough = true },
  CmpItemKindFunction = { fg = c.func_decl },
  CmpItemKindMethod = { fg = c.func_call },
  CmpItemKindVariable = { fg = c.keyword },
  CmpItemKindConstant = { fg = c.keyword },
  CmpItemKindClass = { fg = c.type },
  CmpItemKindInterface = { fg = c.type },
  CmpItemKindStruct = { fg = c.type },
  CmpItemKindModule = { fg = c.type },
  CmpItemKindProperty = { fg = c.func_call },
  CmpItemKindField = { fg = c.func_call },
  CmpItemKindEnum = { fg = c.keyword },
  CmpItemKindEnumMember = { fg = c.func_call },
  CmpItemKindKeyword = { fg = c.fg },
  CmpItemKindText = { fg = c.fg },
  CmpItemKindUnit = { fg = c.type },
  CmpItemKindValue = { fg = c.fg },
  CmpItemKindFile = { fg = c.fg },
  CmpItemKindFolder = { fg = c.func_call },

  -- MISC
  WhichKey = { fg = c.func_call },
  WhichKeyGroup = { fg = c.keyword },
  WhichKeyDesc = { fg = c.fg },
  WhichKeySeparator = { fg = c.string },
  WhichKeyFloat = { bg = c.bg_dark },
  WhichKeyBorder = { bg = c.bg_dark, fg = c.border },

  Folded = { bg = c.bg_dark, fg = c.fg_dim },
  FoldColumn = { bg = c.bg_dark, fg = c.fg_dimmest },
  IblIndent = { fg = c.border },
  IblScope = { fg = c.fg_dimmest },

  -- Markdown
  ["@text.uri"] = { fg = c.info, undercurl = true },
  ["@text.literal"] = { fg = c.string },
  ["@markup.raw.markdown_inline"] = { fg = c.string },
}

M = require("base46").override_theme(M, "cursor")

return M
