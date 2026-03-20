-- TODO: blink.cmp integration
plugin("nvim-highlight-colors"):event_defer():opts({
	render = "virtual",
	virtual_symbol = "",
	virtual_symbol_position = "eow",
	virtual_symbol_prefix = " ",
	virtual_symbol_suffix = " ",
})
