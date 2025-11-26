-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- Helper function to find root directory using patterns (replacement for lspconfig.util.root_pattern)
local function root_pattern(...)
  local patterns = { ... }
  return function(startpath)
    local found = vim.fs.find(patterns, { path = startpath, upward = true })[1]
    return found and vim.fs.dirname(found) or nil
  end
end

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.config("ts_ls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable "ts_ls"

vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable "gopls"

vim.lsp.config("basedpyright", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "basedpyright-langserver", "--stdio" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    disableOrganizeImports = true,
    basedpyright = {
      analysis = {
        ignore = { "*" },
        typeCheckingMode = "off",
      },
    },
  },
})
vim.lsp.enable "basedpyright"

vim.lsp.config("pylsp", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501" },
          maxLineLength = 100,
        },
      },
    },
  },
})
vim.lsp.enable "pylsp"

---- yaml
vim.lsp.config("yamlls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://panther-community-us-east-1.s3.amazonaws.com/latest/logschema/schema.json"] = "internal/log_analysis/yamlschemas/schemas/**",
      },
    },
  },
})
vim.lsp.enable "yamlls"

---- Markdown
vim.lsp.config("marksman", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "markdown" },
})
vim.lsp.enable "marksman"

vim.lsp.config("bashls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "bash", "sh", "zsh" },
})
vim.lsp.enable "bashls"

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end
