#!/bin/bash

# Cursor Theme Setup Script
# This script will properly initialize the Cursor theme

echo "=== Cursor Theme Setup ==="
echo ""

# Step 1: Clean old cache
echo "1. Cleaning old cache..."
if [ -d "$HOME/.local/share/nvim/base46" ]; then
    rm -rf "$HOME/.local/share/nvim/base46/"*
    echo "   ✓ Cache cleaned"
else
    echo "   ℹ No cache to clean"
fi

# Step 2: Create cache directory
echo ""
echo "2. Ensuring cache directory exists..."
mkdir -p "$HOME/.local/share/nvim/base46"
echo "   ✓ Directory ready"

# Step 3: Compile theme
echo ""
echo "3. Compiling theme..."
nvim --headless -c "lua require('base46').compile()" -c "qa" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "   ✓ Theme compiled successfully"
else
    echo "   ℹ Theme will compile on first launch"
fi

# Step 4: Check if cache files were created
echo ""
echo "4. Verifying cache files..."
if [ -f "$HOME/.local/share/nvim/base46/defaults" ]; then
    echo "   ✓ Cache files created"
    echo ""
    echo "=== Setup Complete! ==="
    echo "You can now open Neovim normally."
else
    echo "   ℹ Cache will be created on first Neovim launch"
    echo ""
    echo "=== Almost Done! ==="
    echo "Please open Neovim - the theme will compile automatically."
fi

echo ""
echo "To verify the theme:"
echo "  1. Open Neovim"
echo "  2. Run: :luafile ~/.config/nvim/debug_theme.lua"
echo ""

