-- Theme Helper Functions
-- Utilities for managing and testing the Cursor theme

local M = {}

-- Preview all syntax highlighting groups
function M.show_syntax_groups()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'syntax-preview')
  
  local lines = {
    "╔══════════════════════════════════════════════════════════╗",
    "║        Cursor Theme - Syntax Highlighting Preview       ║",
    "╚══════════════════════════════════════════════════════════╝",
    "",
    "-- Keywords and Control Flow",
    "if true then",
    "  for i = 1, 10 do",
    "    return function() end",
    "  end",
    "end",
    "",
    "-- Strings and Numbers",
    'local greeting = "Hello, World!"',
    "local pi = 3.14159",
    "local count = 42",
    "",
    "-- Functions and Methods",
    "local function calculate(x, y)",
    "  return x + y",
    "end",
    "",
    "-- Types and Classes",
    "---@class MyClass",
    "---@field name string",
    "---@field value number",
    "local MyClass = {}",
    "",
    "-- Comments",
    "-- This is a single line comment",
    "-- TODO: Important note",
    "-- NOTE: Another annotation",
    "",
    "-- Operators and Punctuation",
    "local result = (x + y) * z / w",
    "local array = {1, 2, 3, 4, 5}",
    "",
    "-- Diagnostics (simulated)",
    "-- ERROR: This would show an error",
    "-- WARNING: This would show a warning",
    "-- INFO: This would show information",
    "-- HINT: This would show a hint",
  }
  
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    col = math.floor(vim.o.columns * 0.1),
    row = math.floor(vim.o.lines * 0.1),
    style = 'minimal',
    border = 'rounded',
    title = ' Syntax Preview ',
    title_pos = 'center',
  })
  
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal,FloatBorder:FloatBorder')
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':q<CR>', { noremap = true, silent = true })
end

-- Show color palette
function M.show_colors()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  
  local theme = require('themes.cursor')
  local lines = {
    "╔══════════════════════════════════════════════════════════╗",
    "║              Cursor Theme - Color Palette               ║",
    "╚══════════════════════════════════════════════════════════╝",
    "",
    "━━━ Background Colors ━━━",
  }
  
  -- Add base_30 colors
  for name, color in pairs(theme.base_30) do
    table.insert(lines, string.format("  %-20s %s", name, color))
  end
  
  table.insert(lines, "")
  table.insert(lines, "━━━ Base16 Colors ━━━")
  
  -- Add base_16 colors
  for name, color in pairs(theme.base_16) do
    table.insert(lines, string.format("  %-20s %s", name, color))
  end
  
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = math.floor(vim.o.columns * 0.6),
    height = math.floor(vim.o.lines * 0.8),
    col = math.floor(vim.o.columns * 0.2),
    row = math.floor(vim.o.lines * 0.1),
    style = 'minimal',
    border = 'rounded',
    title = ' Color Palette ',
    title_pos = 'center',
  })
  
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal,FloatBorder:FloatBorder')
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':q<CR>', { noremap = true, silent = true })
end

-- Quick theme reload
function M.reload_theme()
  -- Clear base46 cache
  local cache_dir = vim.fn.stdpath('data') .. '/base46/'
  vim.fn.delete(cache_dir, 'rf')
  
  -- Reload configuration
  vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.lua')
  
  print('✓ Theme reloaded successfully!')
end

-- Compare with original hos theme
function M.toggle_theme()
  local chadrc = require('chadrc')
  local current_theme = chadrc.base46.theme
  
  if current_theme == 'cursor' then
    chadrc.base46.theme = 'hos'
    print('Switched to hos theme')
  else
    chadrc.base46.theme = 'cursor'
    print('Switched to cursor theme')
  end
  
  M.reload_theme()
end

-- Show highlight group under cursor
function M.show_hl_group()
  local result = vim.treesitter.get_captures_at_cursor(0)
  if #result == 0 then
    print('No highlight group under cursor')
    return
  end
  
  print('Highlight groups:')
  for _, capture in ipairs(result) do
    print('  - ' .. capture)
  end
end

-- Export theme colors to JSON (useful for other tools)
function M.export_colors()
  local theme = require('themes.cursor')
  local json = vim.fn.json_encode({
    base_30 = theme.base_30,
    base_16 = theme.base_16,
    type = theme.type
  })
  
  local file = io.open(vim.fn.stdpath('config') .. '/cursor_colors.json', 'w')
  if file then
    file:write(json)
    file:close()
    print('✓ Colors exported to cursor_colors.json')
  else
    print('✗ Failed to export colors')
  end
end

-- Create user commands
vim.api.nvim_create_user_command('CursorThemePreview', M.show_syntax_groups, {})
vim.api.nvim_create_user_command('CursorThemeColors', M.show_colors, {})
vim.api.nvim_create_user_command('CursorThemeReload', M.reload_theme, {})
vim.api.nvim_create_user_command('CursorThemeToggle', M.toggle_theme, {})
vim.api.nvim_create_user_command('CursorThemeExport', M.export_colors, {})
vim.api.nvim_create_user_command('CursorThemeHL', M.show_hl_group, {})

return M

