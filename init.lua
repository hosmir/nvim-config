vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
local defaults_cache = vim.g.base46_cache .. "defaults"
local statusline_cache = vim.g.base46_cache .. "statusline"

-- Check if cache exists, if not compile theme first
if vim.fn.filereadable(defaults_cache) == 0 then
  local ok, base46 = pcall(require, "base46")
  if ok then
    base46.compile()
  end
end

-- Load theme cache
pcall(dofile, defaults_cache)
pcall(dofile, statusline_cache)

require "options"
require "nvchad.autocmds"

local o = vim.o
o.relativenumber = true

vim.schedule(function()
  require "mappings"
end)
