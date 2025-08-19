plugin("nui.nvim"):config(false)

plugin("nvim-notify"):opts { render = "wrapped-compact", background_colour = "#000000", stage = "slide" }

plugin("noice.nvim"):event_defer():dep_on("nui.nvim", "nvim-notify"):on_require("noice"):opts {
  --  cmdline = {
  --    view = "cmdline",
  --  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    progress = {
      enabled = true,
    },
    signature = {
      auto_open = {
        enabled = false,
      },
    },
    -- hover = { enabled = false },
  },
  views = {
    mini = {
      win_options = {
        winblend = 0,
      },
    },
  },
  presets = {
    bottom_search = true,
    -- command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true,
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,
  },
  routes = {
    -- INFO: Remove all saved message
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "No information available",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "python.addImport",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "No diagnostics found",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "No results for",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "Hop",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "Errors in request",
      },
      opts = { skip = true },
    },
  },
}
