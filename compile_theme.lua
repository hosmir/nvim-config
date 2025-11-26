-- Force compile Cursor theme
-- Run this once to generate the base46 cache files

print("Compiling Cursor theme...")

-- Load base46 and compile all highlights
local ok, base46 = pcall(require, "base46")

if not ok then
  print("Error: base46 module not found. Make sure NvChad is installed.")
  return
end

-- Compile theme
local compile_ok, err = pcall(function()
  base46.compile()
end)

if compile_ok then
  print("✓ Theme compiled successfully!")
  print("✓ Cache files created in: " .. vim.fn.stdpath('data') .. '/base46/')
  print("\nYou can now restart Neovim normally.")
else
  print("✗ Error compiling theme: " .. tostring(err))
  print("\nTrying alternative method...")
  
  -- Try loading and compiling theme directly
  local theme_ok, theme = pcall(require, "themes.cursor")
  if theme_ok then
    print("✓ Theme file loaded successfully")
    print("Theme type: " .. tostring(theme.type))
    
    -- Try to load all highlights
    local load_ok, load_err = pcall(base46.load_all_highlights)
    if load_ok then
      print("✓ Highlights loaded successfully!")
    else
      print("✗ Error loading highlights: " .. tostring(load_err))
    end
  else
    print("✗ Error loading theme file: " .. tostring(theme))
  end
end

