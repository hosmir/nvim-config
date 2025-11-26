-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- Official Cursor Dark Anysphere v0.0.3 colors
-- Extracted from /Applications/Cursor.app/.../cursor-dark-color-theme.json
-- Note: Using 6-character hex colors (no alpha) for base46 compatibility
local c = {
	-- Core
	bg = "#181818",
	bg_dark = "#141414",
	fg = "#E4E4E4",
	fg_dim = "#9A9A9A",
	fg_dimmer = "#707070",
	fg_dimmest = "#505050",
	border = "#333333",

	-- Syntax (from tokenColors)
	keyword = "#82D2CE",      -- CYAN - package, import, const, func, if, return, etc.
	string = "#e394dc",       -- PINK - strings!
	func_decl = "#efb080",    -- Orange - function declarations
	func_call = "#ebc88d",    -- Yellow - function calls
	func_purple = "#aaa0fa",  -- Purple - some function calls
	type = "#efb080",         -- Orange - types
	type_class = "#87c3ff",   -- Blue - classes
	variable = "#d6d6dd",     -- Light gray - variables
	constant = "#AAA0FA",     -- Purple - constants
	property = "#AAA0FA",     -- Purple - properties
	number = "#ebc88d",       -- Yellow - numbers
	boolean = "#82d2ce",      -- Cyan - booleans
	comment = "#707070",      -- Dimmed gray - comments
	decorator = "#a8cc7c",    -- Green - decorators
	macro = "#a8cc7c",        -- Green - macros
	namespace = "#CCCCCC",    -- Light - namespaces
	operator = "#d6d6dd",     -- Light gray
	self_param = "#CC7C8A",   -- Pink - self/this

	-- UI
	selection = "#404040",
	line_hl = "#262626",
	find_match = "#3d6a8e",

	-- Git
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
}

M.base46 = {
	theme = "cursor",
	hl_override = {
		-- COMMENTS - Dimmed gray, italic
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
		StorageClass = { fg = c.keyword },
		["@storageclass"] = { fg = c.keyword },

		-- STRINGS - PINK (#e394dc)
		String = { fg = c.string },
		["@string"] = { fg = c.string },
		["@string.escape"] = { fg = c.keyword },
		["@string.special"] = { fg = c.keyword },
		Character = { fg = c.variable },
		["@character"] = { fg = c.variable },

		-- FUNCTIONS - Orange declarations, Yellow calls
		Function = { fg = c.func_decl },
		["@function"] = { fg = c.func_decl },
		["@function.call"] = { fg = c.func_call },
		["@function.method"] = { fg = c.func_call },
		["@function.method.call"] = { fg = c.func_call },
		["@function.builtin"] = { fg = c.func_call },
		["@method"] = { fg = c.func_call },
		["@method.call"] = { fg = c.func_call },

		-- TYPES - Orange, Classes Blue
		Type = { fg = c.type },
		["@type"] = { fg = c.type },
		["@type.builtin"] = { fg = c.keyword },
		["@type.definition"] = { fg = c.type },
		["@type.qualifier"] = { fg = c.type },
		Typedef = { fg = c.type },
		Structure = { fg = c.type },
		["@constructor"] = { fg = c.type },

		-- VARIABLES - Light gray, Properties Purple
		Identifier = { fg = c.variable },
		["@variable"] = { fg = c.variable },
		["@variable.parameter"] = { fg = c.variable },
		["@variable.member"] = { fg = c.variable },
		["@variable.builtin"] = { fg = c.variable },
		["@parameter"] = { fg = c.variable },
		["@field"] = { fg = c.variable },
		["@property"] = { fg = c.property },

		-- CONSTANTS - Purple, Numbers Yellow
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
		["@punctuation"] = { fg = c.operator },
		["@punctuation.bracket"] = { fg = c.operator },
		["@punctuation.delimiter"] = { fg = c.operator },
		["@punctuation.special"] = { fg = c.keyword },
		Delimiter = { fg = c.operator },
		Special = { fg = c.func_call },
		SpecialChar = { fg = c.func_call },
		Label = { fg = c.type },
		Macro = { fg = c.macro },
		["@macro"] = { fg = c.macro },

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

		-- Language-specific
		["@lsp.type.variable.go"] = { fg = c.variable },
		["@lsp.type.namespace.go"] = { fg = c.type },

		-- UI ELEMENTS
		Normal = { bg = c.bg, fg = c.fg },
		NormalFloat = { bg = c.bg_dark, fg = c.fg },
		FloatBorder = { bg = c.bg_dark, fg = c.border },
		FloatTitle = { fg = c.func_call, bold = true },
		Visual = { bg = c.selection },
		CursorLine = { bg = c.line_hl },
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

		-- FILE TREE
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

		-- TELESCOPE
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

		-- GIT SIGNS
		GitSignsAdd = { fg = c.git_add },
		GitSignsChange = { fg = c.git_modify },
		GitSignsDelete = { fg = c.git_delete },
		DiffAdd = { bg = "#2a4a2a" },
		DiffChange = { fg = c.git_modify },
		DiffDelete = { bg = "#4a2a2a" },
		DiffText = { bg = c.keyword },
		diffAdded = { fg = c.git_add },
		diffRemoved = { fg = c.git_delete },
		diffChanged = { fg = c.git_modify },

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

		-- WHICHKEY
		WhichKey = { fg = c.func_call },
		WhichKeyGroup = { fg = c.keyword },
		WhichKeyDesc = { fg = c.fg },
		WhichKeySeparator = { fg = c.string },
		WhichKeyFloat = { bg = c.bg_dark },
		WhichKeyBorder = { bg = c.bg_dark, fg = c.border },

		-- MISC
		Folded = { bg = c.bg_dark, fg = c.fg_dim },
		FoldColumn = { bg = c.bg_dark, fg = c.fg_dimmest },
		IblIndent = { fg = c.border },
		IblScope = { fg = c.fg_dimmest },

		-- Notify
		NotifyBackground = { bg = c.bg },
		NotifyERRORBorder = { fg = c.error },
		NotifyERRORIcon = { fg = c.error },
		NotifyERRORTitle = { fg = c.error, bold = true },
		NotifyWARNBorder = { fg = c.warning },
		NotifyWARNIcon = { fg = c.warning },
		NotifyWARNTitle = { fg = c.warning, bold = true },
		NotifyINFOBorder = { fg = c.git_add },
		NotifyINFOIcon = { fg = c.git_add },
		NotifyINFOTitle = { fg = c.git_add, bold = true },
		NotifyDEBUGBorder = { fg = c.constant },
		NotifyDEBUGIcon = { fg = c.constant },
		NotifyDEBUGTitle = { fg = c.constant, bold = true },
		NotifyTRACEBorder = { fg = c.fg },
		NotifyTRACEIcon = { fg = c.fg },
		NotifyTRACETitle = { fg = c.fg, bold = true },

		-- Lazy
		LazyButton = { fg = c.fg, bg = c.string },
		LazyButtonActive = { fg = c.bg_dark, bg = c.fg },
		LazyCommit = { fg = c.git_add },
		LazyCommitType = { fg = c.func_call, bold = true },
		LazyDir = { fg = c.func_call },
		LazyH1 = { fg = c.bg_dark, bg = c.fg },
		LazyH2 = { fg = c.fg, bold = true },
		LazyProgressDone = { fg = c.git_add },
		LazyProgressTodo = { fg = c.fg_dim },
		LazyReasonCmd = { fg = c.git_add },
		LazyReasonEvent = { fg = c.func_call },
		LazyReasonFt = { fg = c.type },
		LazyReasonImport = { fg = c.string },
		LazyReasonKeys = { fg = c.keyword },
		LazyReasonPlugin = { fg = c.constant },
		LazyUrl = { fg = c.info, undercurl = true },

		-- Mason
		MasonHeader = { fg = c.bg_dark, bg = c.keyword, bold = true },
		MasonHighlight = { fg = c.info },
		MasonHighlightBlock = { fg = c.bg_dark, bg = c.keyword },
		MasonHighlightBlockBold = { fg = c.bg_dark, bg = c.keyword, bold = true },
		MasonMuted = { fg = c.string },

		-- Markdown
		["@text.uri"] = { fg = c.info, undercurl = true },
		["@text.literal"] = { fg = c.string },
		["@markup.raw.markdown_inline"] = { fg = c.string },
	},

	hl_add = {},
}

return M
