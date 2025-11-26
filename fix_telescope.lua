-- Fix Telescope Integration
-- Run this to compile the missing telescope integration file

print("Fixing Telescope integration...")

local ok, base46 = pcall(require, "base46")
if not ok then
  print("✗ Error: base46 module not found")
  return
end

-- Compile the full theme including all integrations
local compile_ok, err = pcall(function()
  base46.compile()
end)

if compile_ok then
  print("✓ Theme recompiled with all integrations!")
  print("✓ Telescope integration should now work")
  print("\nPlease restart Neovim to load the new integration.")
else
  print("✗ Error: " .. tostring(err))
end

-- Verify telescope cache was created
local telescope_cache = vim.fn.stdpath('data') .. '/base46/telescope'
if vim.fn.filereadable(telescope_cache) == 1 then
  print("✓ Verified: Telescope cache file exists")
else
  print("⚠ Warning: Telescope cache file still missing")
  print("  Try running: :Lazy sync")
end

