-- plugin("snacks.nvim")
--     :opts({
--       explorer = {
--         enable = true,
--         replace_netrw = true,
--       },
--       picker = {
--         enable = true,
--         sources = {
--           explorer = {},
--         },
--       },
--     })
--     :keys(kmap("n", "<leader>e", function() require("snacks").explorer() end, "Toogle Explorer"))

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

require("oil").setup {
  use_default_keymaps = false,
  experimental_watch_for_changes = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["|"] = "actions.select_vsplit",
    ["\\"] = "actions.select_split",
    ["K"] = "actions.preview",
    ["-"] = "actions.parent",
    ["<C-q>"] = "actions.close",
    ["_"] = "actions.open_cwd",
    ["."] = "actions.cd",
    ["H"] = "actions.toggle_hidden",
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
