**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# 🎨 Cursor IDE Theme

This configuration now includes a beautiful **Cursor IDE theme** that perfectly replicates Cursor's default dark theme!

## 🚀 Available Themes

### ✅ Neovim Theme (Active!)

The theme is already active! Just restart Neovim to see it.

📖 **Documentation:**
- [`CURSOR_THEME_QUICKSTART.md`](CURSOR_THEME_QUICKSTART.md) - Get started in 2 minutes
- [`CURSOR_THEME.md`](CURSOR_THEME.md) - Full documentation and customization guide

**Theme Commands:**
- `:CursorThemePreview` - Preview syntax highlighting
- `:CursorThemeColors` - View color palette
- `:CursorThemeReload` - Reload theme after changes
- `:CursorThemeToggle` - Switch between Cursor and hos themes

### ✅ JetBrains GoLand Theme (NEW!)

Now available for JetBrains GoLand (and all JetBrains IDEs)!

📂 **Location:** `jetbrains-themes/`

📖 **Documentation:**
- [`jetbrains-themes/README.md`](jetbrains-themes/README.md) - Overview
- [`jetbrains-themes/INSTALL.md`](jetbrains-themes/INSTALL.md) - Installation guide
- [`jetbrains-themes/QUICKSTART.txt`](jetbrains-themes/QUICKSTART.txt) - Quick reference

**Quick Install:**
```bash
cd ~/.config/nvim/jetbrains-themes
./install.sh
```

## Features

✨ Perfect color matching with Cursor IDE  
🎯 Full plugin support (Telescope, nvim-tree, cmp, etc.)  
🔧 Easy customization  
📝 Comprehensive documentation  
🎨 **Now available for JetBrains IDEs too!**  

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
2) Cursor IDE https://cursor.sh for the beautiful theme inspiration
