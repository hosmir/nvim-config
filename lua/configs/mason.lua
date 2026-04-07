-- Mason configuration to automatically install LSP servers
-- mason-lspconfig uses lspconfig server names directly

local M = {}

-- List of all LSP servers configured in lspconfig.lua
-- These are the lspconfig server names (mason-lspconfig handles the mapping)
M.ensure_installed = {
  -- From servers array
  "html",
  "cssls",

  -- Individual server configurations
  "ts_ls",
  "gopls",
  "basedpyright",
  "pylsp",
  "yamlls",
  "marksman",
  "bashls",
  "texlab",

  -- From defaults (lua_ls)
  "lua_ls",
}

return M
