local helper = require "utils.functions"

-- ═══════════════════════════════════════════════════════════════════════════
-- CURSOR IDE THEME - EXACT colors from Cursor.app theme file
-- Extracted from /Applications/Cursor.app/.../cursor-dark-color-theme.json
-- ═══════════════════════════════════════════════════════════════════════════
local function apply_cursor_theme()
  -- Official Cursor Dark Anysphere v0.0.3 colors
  local c = {
    bg = "#181818",
    fg = "#E4E4E4",
    comment = "#707070",        -- Dimmed gray (NOT green!)
    keyword = "#82D2CE",        -- CYAN - package, import, const, func, if, return
    string = "#e394dc",         -- PINK - strings!
    func_decl = "#efb080",      -- Orange - function declarations
    func_call = "#ebc88d",      -- Yellow - function calls
    type = "#efb080",           -- Orange - types
    type_class = "#87c3ff",     -- Blue - classes
    variable = "#d6d6dd",       -- Light gray - variables
    constant = "#AAA0FA",       -- Purple - constants
    property = "#AAA0FA",       -- Purple - properties
    number = "#ebc88d",         -- Yellow - numbers
    boolean = "#82d2ce",        -- Cyan - booleans
    decorator = "#a8cc7c",      -- Green - decorators
    operator = "#d6d6dd",       -- Light gray - operators
    namespace = "#CCCCCC",      -- Light - namespaces
    self_param = "#CC7C8A",     -- Pink - self/this
  }

  -- KEYWORDS: package, import, const, func, if, return, defer, var = CYAN (#82D2CE)
  vim.api.nvim_set_hl(0, "Keyword", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.import", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.operator", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@keyword.export", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Statement", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Conditional", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Repeat", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Exception", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Include", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "PreProc", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Define", { fg = c.keyword })
  -- Go-specific keywords
  vim.api.nvim_set_hl(0, "@keyword.import.go", { fg = c.keyword })

  -- STRINGS: PINK (#e394dc)
  vim.api.nvim_set_hl(0, "String", { fg = c.string })
  vim.api.nvim_set_hl(0, "@string", { fg = c.string })
  vim.api.nvim_set_hl(0, "@string.escape", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@string.special", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Character", { fg = c.variable })

  -- VARIABLES = Light gray (#d6d6dd)
  vim.api.nvim_set_hl(0, "Identifier", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@variable", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@variable.member", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@lsp.type.variable.go", { fg = c.variable })

  -- PARAMETERS = Light gray
  vim.api.nvim_set_hl(0, "@parameter", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = c.variable })

  -- FIELDS/PROPERTIES = Purple (#AAA0FA)
  vim.api.nvim_set_hl(0, "@field", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@property", { fg = c.property })
  vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = c.property })

  -- FUNCTIONS = Orange for declarations (#efb080), Yellow for calls (#ebc88d)
  vim.api.nvim_set_hl(0, "Function", { fg = c.func_decl })
  vim.api.nvim_set_hl(0, "@function", { fg = c.func_decl })
  vim.api.nvim_set_hl(0, "@function.call", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@function.method", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@function.method.call", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@method", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@method.call", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = c.func_decl })
  vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = c.func_call })

  -- TYPES = Orange (#efb080)
  vim.api.nvim_set_hl(0, "Type", { fg = c.type })
  vim.api.nvim_set_hl(0, "@type", { fg = c.type })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@type.definition", { fg = c.type })
  vim.api.nvim_set_hl(0, "Typedef", { fg = c.type })
  vim.api.nvim_set_hl(0, "Structure", { fg = c.type })
  vim.api.nvim_set_hl(0, "@constructor", { fg = c.type })
  vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = c.type })
  vim.api.nvim_set_hl(0, "@lsp.type.struct", { fg = c.type })
  vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = c.type })
  vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = c.type_class })

  -- COMMENTS = Dimmed gray (#E4E4E45E) - NOT green!
  vim.api.nvim_set_hl(0, "Comment", { fg = c.comment, italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = c.comment, italic = true })
  vim.api.nvim_set_hl(0, "@lsp.type.comment", { fg = c.comment, italic = true })

  -- NUMBERS = Yellow (#ebc88d)
  vim.api.nvim_set_hl(0, "Number", { fg = c.number })
  vim.api.nvim_set_hl(0, "@number", { fg = c.number })
  vim.api.nvim_set_hl(0, "Float", { fg = c.number })
  vim.api.nvim_set_hl(0, "@float", { fg = c.number })
  vim.api.nvim_set_hl(0, "@lsp.type.number", { fg = c.number })

  -- CONSTANTS = Purple (#AAA0FA), Booleans = Cyan (#82d2ce)
  vim.api.nvim_set_hl(0, "Constant", { fg = c.constant })
  vim.api.nvim_set_hl(0, "@constant", { fg = c.constant })
  vim.api.nvim_set_hl(0, "@constant.builtin", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "@boolean", { fg = c.boolean })
  vim.api.nvim_set_hl(0, "Boolean", { fg = c.boolean })

  -- OPERATORS & PUNCTUATION = Light gray (#d6d6dd)
  vim.api.nvim_set_hl(0, "Operator", { fg = c.operator })
  vim.api.nvim_set_hl(0, "@operator", { fg = c.operator })
  vim.api.nvim_set_hl(0, "@punctuation", { fg = c.operator })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = c.operator })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.operator })
  vim.api.nvim_set_hl(0, "@punctuation.special", { fg = c.keyword })
  vim.api.nvim_set_hl(0, "Delimiter", { fg = c.operator })

  -- NAMESPACE/MODULE = Light (#CCCCCC)
  vim.api.nvim_set_hl(0, "@namespace", { fg = c.namespace })
  vim.api.nvim_set_hl(0, "@module", { fg = c.variable })
  vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = c.namespace })

  -- DECORATORS/MACROS = Green (#a8cc7c)
  vim.api.nvim_set_hl(0, "Macro", { fg = c.decorator })
  vim.api.nvim_set_hl(0, "@macro", { fg = c.decorator })

  -- Special tokens
  vim.api.nvim_set_hl(0, "Special", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "SpecialChar", { fg = c.func_call })
  vim.api.nvim_set_hl(0, "Label", { fg = c.type })
end

-- Apply on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_cursor_theme,
})

-- Apply immediately on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(apply_cursor_theme, 100)
  end,
})

-- Also apply after LSP attaches (for semantic tokens)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.defer_fn(apply_cursor_theme, 200)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.api.nvim_create_user_command("CreateOrOpenNote", function(opts)
      local title = opts.args
      if title == "" then
        vim.notify("Please provide a title.", vim.log.levels.WARN)
        return
      end

      local vault_main = vim.env.VAULT_MAIN or ""
      local inbox_dir = vault_main .. "/§ Inbox/"
      local filename = title:gsub("[^A-Za-z0-9 ]", "") .. ".md"
      local path = vim.fn.expand(inbox_dir .. filename)

      if vim.fn.filereadable(path) == 1 then
        vim.notify("Note exists: " .. filename, vim.log.levels.INFO)
        vim.cmd("edit " .. path)
        return
      end

      -- Generate random ID
      local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      local id = ""
      for _ = 1, 8 do
        local rand = math.random(#charset)
        id = id .. charset:sub(rand, rand)
      end
      local full_id = "nvm-" .. id

      -- Make sure inbox directory exists
      vim.fn.mkdir(inbox_dir, "p")

      -- Write frontmatter and title
      local lines = {
        "---",
        "id: " .. full_id,
        "aliases: " .. title,
        "tags: []",
        "---",
        "",
        "# " .. title,
        "",
      }
      vim.fn.writefile(lines, path)

      vim.notify("New note created: " .. filename, vim.log.levels.INFO)
      vim.cmd("edit " .. path)
    end, { nargs = "*" })
  end,
})

-- Mini files
MiniFiles = MiniFiles

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Setup some globals for debugging (lazy-loaded)
    _G.dd = function(...)
      Snacks.debug.inspect(...)
    end
    _G.bt = function()
      Snacks.debug.backtrace()
    end
    vim.print = _G.dd -- Override print to use snacks for `:=` command
    Snacks.toggle.diagnostics():map "\\p"
    -- Markdown and other filetypes use conceallevel to make text easier to read:
    Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 1 }):map "\\v"
    Snacks.toggle.treesitter():map "\\T"
    Snacks.toggle.inlay_hints():map "\\y"
    Snacks.toggle.indent():map "\\I"
    Snacks.toggle.dim():map "\\D"
  end,
})

-- Lint
-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#usage
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

-- Mini explorer / split
-- Create mappings to modify target window via (custom) split
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    helper.map_split(buf_id, "<C-h>", "belowright horizontal")
    helper.map_split(buf_id, "<C-v>", "belowright vertical")
    helper.map_split(buf_id, "<C-t>", "tab")
  end,
})

local set_mark = function(id, path, desc)
  MiniFiles.set_bookmark(id, path, { desc = desc })
end
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesExplorerOpen",
  callback = function()
    set_mark("c", vim.fn.stdpath "config", "Config") -- path
    set_mark("w", vim.fn.getcwd, "Working directory") -- callable
    set_mark("~", "~", "Home directory")
  end,
})

-- Needed to add comments to sql files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    vim.bo.commentstring = "-- %s"
  end,
})

--- LSP
--- reacts to all LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    require("configs.lspconfig_on_attach").on_attach(client, bufnr)
  end,
})
