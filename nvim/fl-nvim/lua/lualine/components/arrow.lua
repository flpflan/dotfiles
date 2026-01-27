local component = require("lualine.component"):extend()
local highlight = require "lualine.highlight"

local default_options = {
  mark_color = "#94e2d5",
}

function component:init(options)
  component.super.init(self, options)
  self.options = vim.tbl_deep_extend("force", default_options, options or {})
  self.highlights = {
    mark = highlight.create_component_highlight_group({ fg = "#94e2d5" }, "arrow_mark", self.options),
  }
end

function component:update_status()
  if not internal.plugin_loaded "arrow.nvim" then return "" end

  local statusline = require "arrow.statusline"

  local current_buffer = vim.fn.expand("%s"):gsub(vim.fn.getcwd() .. "/", "")
  return highlight.component_format_highlight(self.highlights.mark)
    .. statusline.text_for_statusline_with_icons(current_buffer)
end

return component
