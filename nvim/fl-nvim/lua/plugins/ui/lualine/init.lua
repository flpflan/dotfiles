plugin("lualine-nvim"):event_buffer_enter():dep_on("overseer"):config(function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			ignore_focus = { "TelescopePrompt" },
			disabled_filetypes = {
				statusline = {},
				winbar = { "kulala_ui", "dbee", "dap-repl" },
			},
			-- section_separators = { left = ' ' },
		},
		sections = require("plugins.ui.lualine.sections"),
		winbar = require("plugins.ui.lualine.winbar"),
		inactive_winbar = require("plugins.ui.lualine.winbar"),
		extensions = {
			require("plugins.ui.lualine.extensions.nvim-dap-ui"),
			{
				filetypes = { "gitsigns-blame", "NeogitCommitView", "OverseerList", "undotree", "neotest-summary" },
				winbar = {},
			},
		},
	})
	-- HACK: Makes the bar display immediately on enter buffer
	-- require('lualine').refresh({
	-- 	place = { 'statusline' },
	-- 	force = true
	-- })
end)
