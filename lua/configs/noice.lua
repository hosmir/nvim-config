local M = {}

M.config = {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = false,
    view_warn = false,
    view_history = "messages",
    view_search = "virtualtext",
  },
  notify = { enabled = false },
  presets = {
    command_palette = {
      views = {
        cmdline_popup = {
          position = { row = "40%", col = "50%" },
        },
        cmdline_popupmenu = {
          position = { row = "40%", col = "50%" },
        },
      },
    },
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30,
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = { enabled = false },
    hover = { enabled = false },
    message = { enabled = false },
  },
}

return M
