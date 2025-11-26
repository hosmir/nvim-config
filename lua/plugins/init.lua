return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require "mason"
      local mason_lspconfig = require "mason-lspconfig"
      local mason_config = require "configs.mason"

      mason.setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }

      mason_lspconfig.setup {
        ensure_installed = mason_config.ensure_installed,
        automatic_installation = true,
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup(require("configs.noice").config)
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
    keys = {
      {
        "<leader>pc",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "List all comments",
      },
      {
        "<leader>pd",
        function()
          Snacks.picker.todo_comments { keywords = { "TODO" } }
        end,
        desc = "List TODO comments",
      },
      {
        "<leader>pf",
        function()
          Snacks.picker.todo_comments { keywords = { "FIX", "FIXME" } }
        end,
        desc = "List Fix/Fixme comments",
      },
    },
  },
  { "tpope/vim-dadbod" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_use_nvim_notify = 1

      vim.g.db_ui_tmp_query_location = "~/code/queries"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "echasnovski/mini.pick",
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Open Neogit window" },
    },
    cmd = {
      "Neogit",
    },
    config = function()
      require("neogit").setup()
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.ai").setup(require("configs.mini").ai)
      require("mini.basics").setup(require("configs.mini").basics)
      require("mini.bracketed").setup()
      -- require("mini.clue").setup(require("configs.mini").clue)
      require("mini.comment").setup(require("configs.mini").comment)
      require("mini.cursorword").setup()
      require("mini.diff").setup()
      require("mini.hipatterns").setup(require("configs.mini").hipatterns)
      require("mini.icons").setup()
      require("mini.indentscope").setup()
      -- require("mini.files").setup(require("configs.mini").files)
      require("mini.move").setup(require("configs.mini").move)
      require("mini.notify").setup()
      require("mini.operators").setup()
      require("mini.sessions").setup(require("configs.mini").sessions)
      require("mini.splitjoin").setup {
        mappings = {
          toggle = "\\k",
          split = "sk",
          join = "sj",
        },
      }
      require("mini.surround").setup()
      -- require("mini.bufremove").setup()
      -- require("mini.git").setup()
      -- require("mini.tabline").setup()
      -- require("mini.trailspace").setup()
      -- require("mini.fuzzy").setup()
      -- require("mini.misc").setup()
    end,
  },
  {
    "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("leetcode").setup {
        lang = "golang",
      }
    end,
  },
  {
    "ramilito/kubectl.nvim",
    cmd = { "Kubectl", "Kubectx", "Kubens" },
    -- stylua: ignore
    keys = {
      { "<leader>pk", function()
        vim.cmd [[tabnew]]; require("kubectl").open()
      end, desc = "Kubectl" },
    },
    opts = {},
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    config = function()
      require("outline").setup()
    end,
    {
      "hedyhli/outline.nvim",
      cmd = { "Outline", "OutlineOpen" },
      config = function()
        require("outline").setup()
      end,
      keys = {
        {
          "<leader>so",
          "<cmd>Outline<cr>",
          desc = "Display Outline",
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
      "echasnovski/mini.icons",
    },
    config = function()
      require("render-markdown").setup(require("configs.render-markdown").opts)
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "yaml",
        "bash",
        "python",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            setopt = true,
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    event = "BufRead",
    config = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "2"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    keys = {
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview git hunk" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
    },
  },
}
