-- Theme Debug Script
-- Run this file to check if the theme loads correctly
-- Usage: :luafile ~/.config/nvim/debug_theme.lua

print("=== Cursor Theme Debug ===\n")

-- Check if chadrc exists and has cursor theme set
print("1. Checking chadrc.lua...")
local ok_chadrc, chadrc = pcall(require, "chadrc")
if ok_chadrc then
  print("   ✓ chadrc.lua loaded")
  print("   Current theme: " .. (chadrc.base46.theme or "nil"))
else
  print("   ✗ Error loading chadrc.lua: " .. tostring(chadrc))
  return
end

-- Check if cursor theme file exists
print("\n2. Checking cursor theme file...")
local ok_cursor, cursor_theme = pcall(require, "themes.cursor")
if ok_cursor then
  print("   ✓ cursor.lua loaded successfully")
  print("   Theme type: " .. (cursor_theme.type or "nil"))
  print("   base_30 colors: " .. vim.tbl_count(cursor_theme.base_30 or {}))
  print("   base_16 colors: " .. vim.tbl_count(cursor_theme.base_16 or {}))
else
  print("   ✗ Error loading cursor.lua: " .. tostring(cursor_theme))
  return
end

-- Check base46 cache
print("\n3. Checking base46 cache...")
local cache_dir = vim.fn.stdpath('data') .. '/base46/'
if vim.fn.isdirectory(cache_dir) == 1 then
  print("   ✓ Cache directory exists: " .. cache_dir)
  local files = vim.fn.readdir(cache_dir)
  print("   Cache files: " .. #files)
else
  print("   ✗ Cache directory not found")
end

-- Check if base46 is available
print("\n4. Checking base46 module...")
local ok_base46, base46 = pcall(require, "base46")
if ok_base46 then
  print("   ✓ base46 module loaded")
else
  print("   ✗ Error loading base46: " .. tostring(base46))
end

-- Check termguicolors
print("\n5. Checking terminal settings...")
if vim.opt.termguicolors:get() then
  print("   ✓ termguicolors enabled")
else
  print("   ✗ termguicolors disabled (required for theme)")
end

-- Try to get current colorscheme
print("\n6. Current colorscheme info...")
local current_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
if current_bg then
  print("   Background color: #" .. string.format("%06x", current_bg))
else
  print("   No background color set")
end

print("\n=== Recommendations ===")
print("1. Close ALL Neovim instances")
print("2. Run: rm -rf ~/.local/share/nvim/base46/")
print("3. Open Neovim again")
print("4. If theme still doesn't load, run: :Lazy sync")
print("\nFor NvChad theme switcher:")
print("- The default keybinding is usually <leader>th (Space + th)")
print("- Or use command: :Telescope themes")

