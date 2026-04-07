require("nvchad.configs.lspconfig").defaults()

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {})

-- Go
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
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

-- Python
vim.lsp.config("basedpyright", {
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

vim.lsp.config("pylsp", {
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

-- YAML
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://panther-community-us-east-1.s3.amazonaws.com/latest/logschema/schema.json"] = "internal/log_analysis/yamlschemas/schemas/**",
      },
    },
  },
})

-- Markdown
vim.lsp.config("marksman", {
  filetypes = { "markdown" },
})

-- Bash
vim.lsp.config("bashls", {
  filetypes = { "bash", "sh", "zsh" },
})

-- LaTeX
vim.lsp.config("texlab", {
  filetypes = { "tex", "bib" },
})

vim.lsp.enable {
  "html",
  "cssls",
  "ts_ls",
  "gopls",
  "basedpyright",
  "pylsp",
  "yamlls",
  "marksman",
  "bashls",
  "texlab",
}
