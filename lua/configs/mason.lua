-- Mason configuration to automatically install LSP servers
-- mason-lspconfig uses lspconfig server names directly

local M = {}

-- List of all LSP servers configured in lspconfig.lua
-- These are the lspconfig server names (mason-lspconfig handles the mapping)
M.ensure_installed = {
  -- From servers array
  "html", -- html
  "cssls", -- cssls

  -- Individual server configurations
  "ts_ls", -- ts_ls
  "gopls", -- gopls
  "basedpyright", -- basedpyright
  "pylsp", -- pylsp
  "yamlls", -- yamlls
  "marksman", -- marksman
  "bashls", -- bashls

  -- From defaults (lua_lsp)
  "lua_ls", -- lua_lsp (note: lspconfig uses lua_ls, not lua_lsp)
}

return M
