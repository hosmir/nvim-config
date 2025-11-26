-- Custom UI overrides for Cursor IDE theme
-- EXACT colors from /Applications/Cursor.app/.../cursor-dark-color-theme.json

local M = {}

-- Official Cursor Dark Anysphere v0.0.3 colors
local c = {
	bg = "#181818",
	bg_dark = "#141414",
	fg = "#E4E4E4",
	fg_dim = "#E4E4E48D",
	fg_dimmer = "#E4E4E45E",
	fg_dimmest = "#E4E4E442",
	border = "#E4E4E413",
	keyword = "#82D2CE",
	string = "#e394dc",
	func_decl = "#efb080",
	func_call = "#ebc88d",
	constant = "#AAA0FA",
	variable = "#d6d6dd",
	number = "#ebc88d",
	type = "#efb080",
	type_class = "#87c3ff",
	decorator = "#a8cc7c",
	selection = "#40404099",
	line_hl = "#262626",
	find_match = "#88C0D066",
	git_add = "#70B489",
	git_modify = "#F1B467",
	git_delete = "#FC6B83",
	git_untracked = "#88C0D0",
	git_ignored = "#E4E4E45E",
	error = "#E34671",
	warning = "#F1B467",
	info = "#88C0D0",
	hint = "#E4E4E48D",
}

M.overrides = {
	-- Search highlighting
	IncSearch = { bg = c.find_match, bold = true },
	Search = { bg = c.find_match },
	CurSearch = { bg = c.find_match, bold = true },
	
	-- Visual mode selection
	Visual = { bg = c.selection },
	VisualNOS = { bg = c.selection },
	
	-- Cursor line
	CursorLine = { bg = c.line_hl },
	CursorLineNr = { fg = c.fg, bold = true },
	CursorColumn = { bg = c.line_hl },
	
	-- Line numbers
	LineNr = { fg = c.fg_dimmest },
	LineNrAbove = { fg = c.fg_dimmest },
	LineNrBelow = { fg = c.fg_dimmest },
	SignColumn = { bg = c.bg },
	
	-- Statusline
	StatusLine = { bg = c.bg_dark, fg = c.fg_dim },
	StatusLineNC = { bg = c.bg_dark, fg = c.fg_dimmer },
	
	-- Tabline/Bufferline
	TbBufOn = { fg = c.fg, bg = c.bg, bold = true },
	TbBufOff = { fg = c.fg_dimmest, bg = c.bg_dark },
	TbBufOnClose = { fg = c.fg, bg = c.bg },
	TbBufOffClose = { fg = c.fg_dimmest, bg = c.bg_dark },
	TbBufOnModified = { fg = c.keyword, bg = c.bg },
	TbBufOffModified = { fg = c.keyword, bg = c.bg_dark },
	
	TbTabOn = { fg = c.fg, bg = c.bg, bold = true },
	TbTabOff = { fg = c.fg_dimmest, bg = c.bg_dark },
	TbTabCloseBtn = { fg = c.error, bg = c.bg_dark },
	TbTabNewBtn = { fg = c.keyword, bg = c.bg_dark },
	
	-- NvimTree
	NvimTreeNormal = { bg = c.bg_dark, fg = c.fg_dim },
	NvimTreeNormalNC = { bg = c.bg_dark, fg = c.fg_dim },
	NvimTreeWinSeparator = { fg = c.border, bg = c.bg },
	NvimTreeRootFolder = { fg = c.fg_dim },
	NvimTreeFolderName = { fg = c.fg_dim },
	NvimTreeFolderIcon = { fg = c.func_call },
	NvimTreeOpenedFolderName = { fg = c.fg_dim, bold = true },
	NvimTreeIndentMarker = { fg = c.border },
	
	-- Git status colors
	NvimTreeGitDirty = { fg = c.git_modify },
	NvimTreeGitStaged = { fg = c.git_add },
	NvimTreeGitMerge = { fg = c.constant },
	NvimTreeGitRenamed = { fg = c.git_untracked },
	NvimTreeGitNew = { fg = c.git_untracked },
	NvimTreeGitDeleted = { fg = c.git_delete },
	NvimTreeGitIgnored = { fg = c.git_ignored },
	
	NvimTreeSpecialFile = { fg = c.decorator, bold = true, underline = true },
	
	-- File git status
	NvimTreeFileDirty = { fg = c.git_modify },
	NvimTreeFileNew = { fg = c.git_untracked },
	NvimTreeFileDeleted = { fg = c.git_delete },
	NvimTreeFileStaged = { fg = c.git_add },
	NvimTreeFileRenamed = { fg = c.git_untracked },
	NvimTreeFileMerge = { fg = c.constant },
	NvimTreeFileIgnored = { fg = c.git_ignored },
	
	-- Telescope
	TelescopeNormal = { bg = c.bg_dark, fg = c.fg },
	TelescopeBorder = { bg = c.bg_dark, fg = c.border },
	TelescopePromptNormal = { bg = c.bg, fg = c.fg },
	TelescopePromptBorder = { bg = c.bg, fg = c.border },
	TelescopePromptTitle = { bg = c.info, fg = c.bg_dark, bold = true },
	TelescopePreviewTitle = { bg = c.keyword, fg = c.bg_dark, bold = true },
	TelescopeResultsTitle = { bg = c.constant, fg = c.bg_dark, bold = true },
	TelescopeSelection = { bg = "#E4E4E41E", fg = c.fg, bold = true },
	TelescopeSelectionCaret = { fg = c.info, bg = "#E4E4E41E" },
	TelescopeMatching = { fg = c.info, bold = true },
	
	-- CMP
	CmpItemAbbrMatch = { fg = c.info, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = c.info },
	CmpItemKindFunction = { fg = c.func_decl },
	CmpItemKindMethod = { fg = c.func_call },
	CmpItemKindVariable = { fg = c.keyword },
	CmpItemKindKeyword = { fg = c.fg },
	CmpItemKindProperty = { fg = c.func_call },
	CmpItemKindUnit = { fg = c.type },
	CmpItemKindClass = { fg = c.type },
	CmpItemKindInterface = { fg = c.type },
	CmpItemKindModule = { fg = c.type },
	CmpItemKindSnippet = { fg = c.string },
	CmpItemKindText = { fg = c.fg },
	
	-- Diagnostics
	DiagnosticVirtualTextError = { fg = c.error, italic = true },
	DiagnosticVirtualTextWarn = { fg = c.warning, italic = true },
	DiagnosticVirtualTextInfo = { fg = c.info, italic = true },
	DiagnosticVirtualTextHint = { fg = c.hint, italic = true },
	
	DiagnosticUnderlineError = { undercurl = true, sp = c.error },
	DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
	DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
	DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
	
	-- Git signs
	GitSignsAdd = { fg = c.git_add },
	GitSignsChange = { fg = c.git_modify },
	GitSignsDelete = { fg = c.git_delete },
	GitSignsAddLn = { bg = "#3FA26633" },
	GitSignsChangeLn = { bg = "#D2943E33" },
	GitSignsDeleteLn = { bg = "#B8004933" },
	GitSignsAddNr = { fg = c.git_add },
	GitSignsChangeNr = { fg = c.git_modify },
	GitSignsDeleteNr = { fg = c.git_delete },
	
	-- Floating windows
	NormalFloat = { bg = c.bg_dark, fg = c.fg },
	FloatBorder = { bg = c.bg_dark, fg = c.border },
	FloatTitle = { bg = c.bg_dark, fg = c.func_call, bold = true },
	
	-- Popup menu
	Pmenu = { bg = c.bg_dark, fg = c.fg },
	PmenuSel = { bg = "#343434", fg = c.fg, bold = true },
	PmenuSbar = { bg = c.bg_dark },
	PmenuThumb = { bg = c.fg_dimmest },
	PmenuKind = { bg = c.bg_dark, fg = c.keyword },
	PmenuKindSel = { bg = "#343434", fg = c.keyword },
	PmenuExtra = { bg = c.bg_dark, fg = c.fg_dimmest },
	PmenuExtraSel = { bg = "#343434", fg = c.fg_dimmest },
	
	-- Folding
	Folded = { bg = c.bg_dark, fg = c.fg_dim },
	FoldColumn = { bg = c.bg_dark, fg = c.fg_dimmest },
	
	-- Spelling
	SpellBad = { undercurl = true, sp = c.error },
	SpellCap = { undercurl = true, sp = c.info },
	SpellRare = { undercurl = true, sp = c.keyword },
	SpellLocal = { undercurl = true, sp = c.keyword },
	
	-- Window separator
	WinSeparator = { fg = c.border },
	VertSplit = { fg = c.border },
	
	-- Diff colors
	DiffAdd = { bg = "#3FA26633" },
	DiffChange = { bg = "#D2943E33" },
	DiffDelete = { bg = "#B8004933", fg = c.fg_dimmest },
	DiffText = { bg = "#88C0D066" },
	
	-- Indent guides
	IblIndent = { fg = c.border },
	IblScope = { fg = c.fg_dimmest },
	
	-- Matching parentheses
	MatchParen = { bg = "#E4E4E41E", bold = true },
	
	-- WhichKey
	WhichKey = { fg = c.func_call },
	WhichKeyGroup = { fg = c.keyword },
	WhichKeyDesc = { fg = c.fg },
	WhichKeySeparator = { fg = c.string },
	WhichKeyFloat = { bg = c.bg_dark },
	WhichKeyBorder = { bg = c.bg_dark, fg = c.border },
	
	-- Dashboard/Alpha
	AlphaHeader = { fg = c.info },
	AlphaButton = { fg = c.fg },
	AlphaShortcut = { fg = c.keyword },
	AlphaFooter = { fg = c.fg_dimmer, italic = true },
	
	-- Noice
	NoicePopup = { bg = c.bg_dark, fg = c.fg },
	NoicePopupmenu = { bg = c.bg_dark, fg = c.fg },
	NoicePopupmenuSelected = { bg = "#343434", fg = c.fg, bold = true },
	NoiceCmdlinePopup = { bg = c.bg, fg = c.fg },
	NoiceCmdlineIcon = { fg = c.info },
	
	-- Notify
	NotifyBackground = { bg = c.bg },
	NotifyERRORBorder = { fg = c.error },
	NotifyWARNBorder = { fg = c.warning },
	NotifyINFOBorder = { fg = c.git_add },
	NotifyDEBUGBorder = { fg = c.constant },
	NotifyTRACEBorder = { fg = c.fg },
	NotifyERRORIcon = { fg = c.error },
	NotifyWARNIcon = { fg = c.warning },
	NotifyINFOIcon = { fg = c.git_add },
	NotifyDEBUGIcon = { fg = c.constant },
	NotifyTRACEIcon = { fg = c.fg },
	NotifyERRORTitle = { fg = c.error, bold = true },
	NotifyWARNTitle = { fg = c.warning, bold = true },
	NotifyINFOTitle = { fg = c.git_add, bold = true },
	NotifyDEBUGTitle = { fg = c.constant, bold = true },
	NotifyTRACETitle = { fg = c.fg, bold = true },
}

return M
