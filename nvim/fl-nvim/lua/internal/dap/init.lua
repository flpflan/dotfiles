local M = {}

---@param ft string
function M.clear(ft)
	require("dap").configurations[ft] = {}
end

---@type table<string, dap.Adapter|dap.AdapterFactory>
local adapters = {}

---@param name string
---@param opts dap.Adapter|dap.AdapterFactory
function M.adapter(name, opts)
	adapters[name] = opts
end

function M.init_adapters()
	local dap = require("dap")
	for name, opts in pairs(adapters) do
		dap.adapters[name] = opts
	end
end

return M
