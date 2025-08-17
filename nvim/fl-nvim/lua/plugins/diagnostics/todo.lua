plugin("todo-comments.nvim"):on_require("todo-comments"):event_defer():opts({
	highlight = {
		multiline = false,
		-- vimgrep regex, supporting the pattern TODO(name):
		pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
	},
	search = {
		-- ripgrep regex, supporting the pattern TODO(name):
		pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
	},
})
