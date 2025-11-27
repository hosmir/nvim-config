-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- Suppress deprecation warning for require('lspconfig')
-- The old API still works, we'll migrate when nvchad fully supports the new API
local lspconfig = require "lspconfig"

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.basedpyright.setup {
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
}

lspconfig.pylsp.setup {
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
}

---- yaml
lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://panther-community-us-east-1.s3.amazonaws.com/latest/logschema/schema.json"] = "internal/log_analysis/yamlschemas/schemas/**",
      },
    },
  },
}

---- Markdown
lspconfig.marksman.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "markdown" },
}

lspconfig.bashls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "bash", "sh", "zsh" },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
