workspace.init()

workspace.launch_configs_ft("go", {
  name = "debug",
  program = joinpath(cwd(), "test", "main.go"),
})

workspace.launch_configs_ft("python", {
  name = "Debug python",
  request = "launch",
  program = "${file}",
  console = "integratedTerminal",
})

local enter_launch_url = function()
  local co = coroutine.running()
  return coroutine.create(function()
    vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
      if url == nil or url == "" then
        return
      else
        coroutine.resume(co, url)
      end
    end)
  end)
end

for _, language in ipairs { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" } do
  workspace.launch_configs_ft(language, {
    {
      type = "pwa-chrome",
      name = "Launch Chrome (nvim-dap)",
      url = enter_launch_url,
      request = "attach",
      -- program = "${file}",
      -- cwd = vim.fn.getcwd(),
      sourceMaps = true,
      -- protocol = "inspector",
      -- port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file using Node.js",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file using Node.js with ts-node/register (nvim-dap)",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "-r", "ts-node/register" },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process using Node.js (nvim-dap)",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  })
end
