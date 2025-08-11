plugin("nui.nvim"):config(false)

plugin("nvim-notify")
    :event_defer()
    :on_plugin("noice-nvim")
    :opts { render = "wrapped-compact", background_colour = "#000000", stage = "slide" }

plugin("noice.nvim"):opts {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    -- command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
}
-- plugin("noice.nvim")
-- 	:for_cat("core")
-- 	:event_defer()
-- 	:on_require("noice")
-- 	:keys({
-- 		kgroup("<leader>n", "notifications", {}, {
-- 			kmap("n", "d", kcmd("Noice dismiss"), "dismiss notifications"),
-- 			kmap("n", "l", kcmd("Noice last"), "last notifications"),
-- 		}),
-- 	})
-- 	:opts({
-- 		cmdline = {
-- 			view = "cmdline",
-- 		},
-- 		-- add any options here
-- 		presets = {
-- 			bottom_search = true, -- use a classic bottom cmdline for search
-- 			command_palette = false, -- position the cmdline and popupmenu together
-- 			long_message_to_split = true, -- long messages will be sent to a split
-- 			inc_rename = false, -- enables an input dialog for inc-rename.nvim
-- 			lsp_doc_border = true, -- add a border to hover docs and signature help
-- 		},
-- 		lsp = {
-- 			progress = {
-- 				enabled = true,
-- 			},
-- 			signature = {
-- 				auto_open = {
-- 					enabled = false,
-- 				},
-- 			},
-- 			-- hover = { enabled = false },
-- 		},
-- 		views = {
-- 			mini = {
-- 				win_options = {
-- 					winblend = 0,
-- 				},
-- 			},
-- 		},
-- 		routes = {
-- 			-- INFO: Remove all saved message
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					kind = "",
-- 					find = "No information available",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "written",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "python.addImport",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "No diagnostics found",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "No results for",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "Hop",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					find = "Errors in request",
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 		},
-- 	})
