plugin("nui.nvim"):config(false)
plugin("plenary.nvim"):config(false)
plugin("nvim-web-devicons"):config(false)
plugin("snacks.nvim"):config(false)
-- plugin("image.nvim"):config(false)
plugin("nvim-lsp-file-operations"):config(false)

plugin("neo-tree.nvim")
  :on_require("neo-tree")
  :cmd("Neotree")
  :keys(kmap("n", "<leader>e", kcmd "Neotree toggle", "Toogle Explorer"))
  :opts {
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status" },
    window = {
      width = 30,
    },
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = { hide_gitignored = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
    },
  }

-- TODO: yazi.nvim
require("oil").setup {
  use_default_keymaps = false,
  experimental_watch_for_changes = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<C-t>"] = "actions.select_tab",
    ["|"] = "actions.select_vsplit",
    ["\\"] = "actions.select_split",
    ["<CR>"] = "actions.select",
    ["l"] = "actions.select",
    ["<Right>"] = "actions.select",
    ["K"] = "actions.preview",
    ["-"] = "actions.parent",
    ["h"] = "actions.parent",
    ["<Left>"] = "actions.parent",
    ["<C-q>"] = "actions.close",
    ["q"] = "actions.close",
    ["<Esc>"] = "actions.close",
    ["<leader>e"] = "actions.close",
    ["_"] = "actions.open_cwd",
    ["."] = "actions.cd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["H"] = "actions.toggle_hidden",
    ["gr"] = "actions.refresh",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g\\"] = "actions.toggle_trash",
  },
  view_options = {
    show_hidden = false,
    natural_order = false,
  },
  win_options = {
    signcolumn = "number",
    -- signcolumn = "yes:2",
  },
}
local status_const = require "oil-vcs-status.constant.status"

local StatusType = status_const.StatusType
require("oil-vcs-status").setup {
  status_symbol = {
    [StatusType.Added] = "",
    [StatusType.Copied] = "󰆏",
    [StatusType.Deleted] = "",
    [StatusType.Ignored] = "",
    [StatusType.Modified] = "",
    [StatusType.Renamed] = "",
    [StatusType.TypeChanged] = "󰉺",
    [StatusType.Unmodified] = " ",
    [StatusType.Unmerged] = "",
    [StatusType.Untracked] = "",
    [StatusType.External] = "",

    [StatusType.UpstreamAdded] = "󰈞",
    [StatusType.UpstreamCopied] = "󰈢",
    [StatusType.UpstreamDeleted] = "",
    [StatusType.UpstreamIgnored] = " ",
    [StatusType.UpstreamModified] = "󰏫",
    [StatusType.UpstreamRenamed] = "",
    [StatusType.UpstreamTypeChanged] = "󱧶",
    [StatusType.UpstreamUnmodified] = " ",
    [StatusType.UpstreamUnmerged] = "",
    [StatusType.UpstreamUntracked] = " ",
    [StatusType.UpstreamExternal] = "",
  },
}
require("oil-vcs-status").init()

require("oil-lsp-diagnostics").setup()
require("oil-git").setup {}
-- require("oil-git-status").setup {
--   show_ignored = true,
--   symbols = {
--     index = {
--       ["!"] = "",
--       ["?"] = "",
--       ["A"] = "",
--       ["C"] = "󰆏",
--       ["D"] = "",
--       ["M"] = "",
--       ["R"] = "",
--       ["T"] = "󰉺",
--       ["U"] = "",
--       [" "] = " ",
--     },
--     working_tree = {
--       ["!"] = "!",
--       ["?"] = "?",
--       ["A"] = "A",
--       ["C"] = "C",
--       ["D"] = "D",
--       ["M"] = "M",
--       ["R"] = "R",
--       ["T"] = "T",
--       ["U"] = "U",
--       [" "] = " ",
--     },
--   },
-- }

kmap("n", "-", function()
  if vim.bo.filetype:match "^Neogit" then vim.cmd "q" end
  vim.cmd "Oil --float"
end, "Open filesystem")
kmap("n", "_", function() vim.cmd("Oil --float " .. vim.fn.getcwd()) end, "Open current working directory")
