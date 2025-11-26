-- Cursor Theme Preview File
-- Open this file in Neovim to see the theme colors in action!
-- This file demonstrates syntax highlighting with the Cursor theme

---@class UserConfig
---@field name string User's name
---@field settings table Configuration settings
local M = {}

-- Constants and numbers
local VERSION = "1.0.0"
local MAX_RETRIES = 5
local TIMEOUT = 30.5
local IS_ENABLED = true
local IS_DISABLED = false

-- Strings and escape sequences
local greeting = "Hello, World! 👋"
local path = "/usr/local/bin"
local template = string.format("Version: %s", VERSION)
local multiline = [[
  This is a multiline string
  that spans multiple lines
]]

-- Functions and methods
local function calculate_sum(a, b)
  return a + b
end

---Calculate the product of two numbers
---@param x number First number
---@param y number Second number
---@return number product The product of x and y
function M.calculate_product(x, y)
  -- This is a comment explaining the calculation
  local result = x * y
  return result
end

-- Control flow and keywords
local function process_data(items)
  if not items or #items == 0 then
    print("No items to process")
    return nil
  end
  
  for i, item in ipairs(items) do
    if item.enabled then
      local status = item:process()
      
      while status.pending do
        -- Wait for completion
        vim.wait(100)
      end
      
      if status.success then
        print(string.format("✓ Processed item %d", i))
      else
        print(string.format("✗ Failed item %d: %s", i, status.error))
      end
    end
  end
  
  return true
end

-- Tables and data structures
M.config = {
  -- User settings
  user = {
    name = "Developer",
    email = "dev@example.com",
    preferences = {
      theme = "cursor",
      font_size = 14,
      line_numbers = true,
    },
  },
  
  -- Editor settings
  editor = {
    tab_size = 2,
    indent_with_spaces = true,
    word_wrap = false,
    rulers = { 80, 120 },
  },
  
  -- LSP configuration
  lsp = {
    enabled = true,
    servers = { "lua_ls", "tsserver", "pyright" },
    on_attach = function(client, bufnr)
      -- Set up keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    end,
  },
}

-- Object-oriented programming
---@class Logger
---@field level string Log level
local Logger = {}
Logger.__index = Logger

---Create a new Logger instance
---@param level string Log level (debug, info, warn, error)
---@return Logger
function Logger.new(level)
  local self = setmetatable({}, Logger)
  self.level = level or "info"
  return self
end

---Log a message
---@param message string Message to log
function Logger:log(message)
  print(string.format("[%s] %s", self.level:upper(), message))
end

-- Error handling
local function safe_execute(fn, ...)
  local ok, result = pcall(fn, ...)
  
  if not ok then
    vim.notify("Error: " .. tostring(result), vim.log.levels.ERROR)
    return nil
  end
  
  return result
end

-- Regular expressions and patterns
local email_pattern = "[%w%._%+%-]+@[%w%._%+%-]+%.%a%a+"
local url_pattern = "https?://[%w-._~:/?#%[%]@!$&'()*+,;=]+"

-- Operators and symbols
local math_expression = (10 + 20) * 3 / 2 - 5 % 2
local logical_expression = true and false or not true
local comparison = 100 >= 50 and 25 <= 30
local concat = "Hello" .. " " .. "World"

-- Vim API examples
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_user_command("TestCommand", function(opts)
  print("Command executed with args:", vim.inspect(opts.args))
end, { nargs = "*" })

-- Highlight group examples (these are comments demonstrating different types)
-- ERROR: This would show as an error
-- WARNING: This would show as a warning  
-- INFO: This would show as information
-- HINT: This would show as a hint
-- TODO: Something to do later
-- NOTE: Important note
-- FIXME: Something that needs fixing
-- HACK: Temporary solution
-- PERF: Performance related
-- BUG: Known bug

-- Markdown-style comments
-- # Heading 1
-- ## Heading 2
-- ### Heading 3
-- **Bold text**
-- *Italic text*
-- `inline code`

-- Special characters and escape sequences
local escaped = "Line 1\nLine 2\tTabbed\r\nWindows line ending"
local unicode = "Hello 世界 🌍"
local raw = [[\n\t\r]]

-- Metatable magic
local meta = {
  __index = function(t, k)
    return "default value"
  end,
  __call = function(t, ...)
    print("Called with:", ...)
  end,
  __tostring = function(t)
    return "Custom object"
  end,
}

-- Module export
return M

--[[
  This is a block comment that spans multiple lines.
  It demonstrates how block comments look with the theme.
  
  The Cursor theme should make this easily readable while
  keeping it visually distinct from the code.
]]

-- End of file
-- vim: ts=2 sw=2 et

