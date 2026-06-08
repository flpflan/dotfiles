if not nixCats "core.debugging" then return end

local dap_func = require "internal.dap_func"
plugin("nvim-dap")
  :event_defer()
  :on_require("dap")
  :config(function()
    -- INFO: define symbols
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
    vim.cmd "highlight DapStoppedSign guifg=#87D285"
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStoppedSign", linehl = "DapStoppedSign", numhl = "" })
    require("internal.dap").init_adapters()
    require("overseer").enable_dap()
  end)
  :keys {
    kmap("n", "<F5>", dap_func "continue", "DAP start / continue"),
    kmap("n", "<F10>", dap_func "step_over", "DAP step over"),
    kmap("n", "<F11>", dap_func "step_into", "DAP step into"),
    kmap("n", "<F12>", dap_func "step_out", "DAP step out"),
    kgroup("<leader>d", "DAP", {}, {
      kmap("n", "b", dap_func "toggle_breakpoint", "Toggle Breakpoint"),
      kmap("n", "g", dap_func "run_to_cursor", "Run to Cursor"),
      kmap("n", "l", dap_func "log_point", "Log Point"),
      kmap("n", "B", dap_func "cond_point", "Conditional Breakpoint"),
      kmap("n", "s", dap_func "terminate", "Stop Debugging Session"),
      kmap("n", "t", dap_func "debug_test", "Debug Closest Test"),
      kmap("n", "r", dap_func "run_last", "Run Last Config"),
      kmap("n", "e", dap_func "eval", "Evaluate Expression"),
    }),
  }

plugin("nvim-dap-view"):on_plugin("nvim-dap"):keys {
  kgroup("<leader>d", "DAP", {}, {
    kmap("n", "u", klazy("dap-view").toggle(), "Toggle Debugger UI"),
    kmap("n", "h", klazy("dap-view").hover(), "Debugger Hover"),
  }),
}

plugin("nvim-dap-ui")
  :on_require("dapui")
  :on_plugin("nvim-dap")
  :opts({
    floating = {
      border = "rounded",
    },
    -- layouts = require("internal.dap_ui").generate_layouts(),
  })
  :setup(function()
    local elements = require("dapui").elements
    ---@diagnostic disable-next-line: inject-field
    elements.repl.allow_without_session = true
    ---@diagnostic disable-next-line: inject-field
    elements.console.allow_without_session = true
  end)
  :keys {
    kgroup("<leader>d", "DAP", {}, {
      kmap("n", "u", function() require("dapui").toggle() end, "Toggle Debugger UI"),
      kmap("n", "h", function() require("dap.ui.widgets").hover() end, "Debugger Hover"),
      kmap("n", "E", function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then require("dapui").eval(expr, { enter = true }) end
        end)
      end, "Evaluate Input"),
      kmap(
        "n",
        "c",
        function()
          require("dapui").float_element("repl", {
            width = get_width(0.9),
            height = get_height(0.9),
            enter = true,
            position = "center",
          })
        end,
        "Dap Console (REPL)"
      ),
      kmap(
        "n",
        "C",
        function()
          require("dapui").float_element("console", {
            width = get_width(0.9),
            height = get_height(0.9),
            enter = true,
            position = "center",
          })
        end,
        "Dap Console (Console)"
      ),
    }),
  }

local virtual_max_char = 20
plugin("nvim-dap-virtual-text")
  :opts({
    only_first_definition = false,
    virt_text_pos = "inline",
    show_stop_reason = false,
    display_callback = function(variable, buf, stackframe, node, options)
      local value = variable.value
      if #value > virtual_max_char then value = "*" end
      if options.virt_text_pos == "inline" then
        return "(" .. value .. ")"
      else
        local name = variable.name
        if #name > virtual_max_char - 3 then
          -- grab the 7 first chars
          name = string.sub(variable.name, 1, 7) .. "..."
        end
        return name .. " = " .. value
      end
    end,
  })
  :on_plugin "nvim-dap"

-- FIXME: No effect
-- plugin("nvim-dap-repl-highlights")
--   :dep_on("nvim-treesitter", "nvim-dap")
--   :event_defer()
--   :config(function()
--     require('nvim-dap-repl-highlights').setup()
--   end)
