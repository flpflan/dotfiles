require("zoxide"):setup({ update_db = true })

require("git"):setup({ order = 0 })

require("full-border"):setup()

require("starship"):setup({
	show_right_prompt = false,
})

require("session"):setup({
	sync_yanked = true,
})

require("folder-rules"):setup()

require("smart-enter"):setup({
	open_multi = true,
})

-- if target_os() == "macos" then
-- 	require("mactag"):setup {
-- 		keys = {
-- 			r = "Red",
-- 			o = "Orange",
-- 			y = "Yellow",
-- 			g = "Green",
-- 			b = "Blue",
-- 			p = "Purple",
-- 		},
-- 		colors = {
-- 			Red = "#ee7b70",
-- 			Orange = "#f5bd5c",
-- 			Yellow = "#fbe764",
-- 			Green = "#91fc87",
-- 			Blue = "#5fa3f8",
-- 			Purple = "#cb88f8",
-- 		},
-- 	}
-- end

-- require("gvfs"):setup({
-- 	which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
-- 	input_position = { "center", y = 0, w = 60 },
-- 	save_path = os.getenv("XDG_CACHE_HOME") .. "/yazi/gvfs.private",
-- 	save_password_autoconfirm = true,
-- })

local bookmarks = {
	{ tag = "Desktop", path = "~/Desktop", key = "d" },
	{ tag = "Documents", path = "~/Documents", key = "D" },
	{ tag = "Downloads", path = "~/Downloads", key = "o" },
}

require("whoosh"):setup({
	bookmarks = bookmarks,
	bookmarks_path = (os.getenv("HOME") .. "/.config/yazi/plugins/whoosh.yazi/bookmarks"),
})
